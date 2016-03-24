//
//  LBNConsultaCEP.m
//
//  Created by Luciano Bastos Nunes on 18/03/16.
//  Copyright © 2016 Tap4Mobile LTDA. All rights reserved.
//

#import "LBNConsultaCEP.h"

#import "BRYHTMLParser.h"

#define CORREIOS_URL @"http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm"

@implementation LBNConsultaCEP

+(void) getAddressFromCEP:(NSString *)cep Response:(void(^)(id, NSError *))block {
    
    NSURL *url = [NSURL URLWithString:CORREIOS_URL];
    
    // HTTP request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    NSString *postString = [NSString stringWithFormat:@"relaxation=%@&semelhante=N&tipoCEP=ALL",cep];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            
            NSString *html = [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSASCIIStringEncoding];
            HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:nil];
            
            id<HTMLNode> bodyNode = [parser body];
            
            NSArray *tableNodes = [bodyNode findChildTags:@"table"];
            
            NSMutableArray *content = [[NSMutableArray alloc] init];
            
            for (id<HTMLNode> tableNode in tableNodes) {
                
                if ([[tableNode getAttributeNamed:@"class"] isEqualToString:@"tmptabela"]) {
                    
                    NSArray *tdTags = [tableNode findChildTags:@"td"];
                    
                    NSMutableDictionary *address = [[NSMutableDictionary alloc] init];
                    NSArray *keys = @[@"rua", @"bairro", @"cidadeEstado", @"cep"];
                    NSInteger index = 0;
                    for (id<HTMLNode> tdTag in tdTags) {
                        
                        [address setObject:[tdTag contents] forKey:keys[index++]];
                    }
                    
                    [content addObject:address];
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if ([content count]) {
                    
                    if (block) {
                        
                        block(content, nil);
                    }
                    
                } else {
                    
                    if (block) {
                        
                        NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
                        [errorDetail setValue:@"CEP não encontrado"  forKey:NSLocalizedDescriptionKey];
                        NSError *localError = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];
                        
                        block(nil, localError);
                    }
                }
            });
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (block) {
                    
                    NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
                    [errorDetail setValue:@"Por favor verifique sua conexão com a internet e tente novamente"  forKey:NSLocalizedDescriptionKey];
                    NSError *localError = [NSError errorWithDomain:@"myDomain" code:100 userInfo:errorDetail];
                    
                    block(nil, localError);
                }
            });
        }
    }];
    
    [task resume];
}

@end
