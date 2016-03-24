//
//  LBNViewController.m
//  LBNConsultaCEP
//
//  Created by Luciano Bastos Nunes on 03/24/2016.
//  Copyright (c) 2016 Luciano Bastos Nunes. All rights reserved.
//

#import "LBNViewController.h"

#import "LBNConsultaCEP.h"

@interface LBNViewController ()

@property (weak, nonatomic) IBOutlet UITextField *cepTextField;

@property (strong, nonatomic) IBOutlet UIView *street;
@property (strong, nonatomic) IBOutlet UIView *neighborhood;
@property (weak, nonatomic) IBOutlet UILabel *cityState;


- (IBAction)searchButtonClicked:(id)sender;

@end

@implementation LBNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons Methods

- (IBAction)searchButtonClicked:(id)sender {
    
    [LBNConsultaCEP getAddressFromCEP:self.cepTextField.text Response:^(id address, NSError *error) {
       
        if (!error) {
            
            self.street.text = address[@"rua"];
            self.neighborhood.text = address[@"bairro"];
            self.cityState.text = address[@"cidadeEstado"];
            
        } else {
            
            self.neighborhood.text = error.localizedDescription;
        }
    }];
}

@end
