//
//  SPViewController.m
//  SatispayAppExtension
//
//  Created by Pierluigi D'Andrea on 07/18/2016.
//  Copyright (c) 2016 Pierluigi D'Andrea. All rights reserved.
//

#import "SPViewController.h"
#import <SatispayAppExtension/SatispayExtension.h>

@interface SPViewController ()

@property (nonatomic, strong) IBOutlet UILabel * resultLabel;
@property (nonatomic, strong) IBOutlet UILabel * payLabel;
@property (nonatomic, strong) IBOutlet UITextField * uuidTextField;

@end

@implementation SPViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    if (![SatispayExtension isExtensionSupported]) {

        self.uuidTextField.enabled = NO;

        self.resultLabel.textColor = [UIColor redColor];
        self.resultLabel.text = @"Satispay App Extension not supported";

        self.payLabel.text = @"Continue in Satispay";

    }

}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section != 1) {
        return;
    }

    if (![SatispayExtension isExtensionSupported]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"satispay://"]];
        return;
    }

    SatispayExtension * extension = [SatispayExtension new];
    [extension requestPaymentOfChargeWithUUID:self.uuidTextField.text
                           fromViewController:self
                                       sender:nil
                                   completion:^(NSError * error) {

                                       //   Here you shold check the current status of the charge with the Satispay server and update your UI accordingly.
                                       if (error) {
                                           self.resultLabel.textColor = [UIColor redColor];
                                           self.resultLabel.text = [NSString stringWithFormat:@"Failure: %@", error.localizedDescription];
                                       } else {
                                           self.resultLabel.textColor = [UIColor greenColor];
                                           self.resultLabel.text = @"Complete";
                                       }

                                   }];

}

@end
