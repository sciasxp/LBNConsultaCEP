//
//  LBNConsultaCEP.h
//
//  Created by Luciano Bastos Nunes on 18/03/16.
//  Copyright © 2016 Tap4Mobile LTDA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBNConsultaCEP : NSObject

+(void) getAddressFromCEP:(NSString *)cep Response:(void(^)(id, NSError *))block;

@end
