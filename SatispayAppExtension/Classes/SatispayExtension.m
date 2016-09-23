//
//  SatispayExtension.m
//  SatispayAppExtension
//
//  Created by Pierluigi D'Andrea on 18/07/16.
//  Copyright © 2016 Satispay. All rights reserved.
//

#import "SatispayExtension.h"

NSString * const SatispayPaymentExtensionErrorDomain = @"SatispayPaymentExtensionErrorDomain";

@implementation SatispayExtension

static NSString * const SatispayPaymentExtensionChargeTypeIdentifier = @"com.satispay.appextension.online";
static NSString * const SatispayPaymentExtensionChargeUUIDKey = @"SatispayPaymentExtensionChargeUUIDKey";

+ (BOOL)isExtensionSupported {

    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"satispay-appextension-feature-online-charge://"]];

}

- (void)requestPaymentOfChargeWithUUID:(nonnull NSString *)UUID
                    fromViewController:(nonnull UIViewController *)sourceViewController
                                sender:(nullable id)sender
                            completion:(nullable void (^)(NSError * __nullable error))completion {

    NSParameterAssert(UUID != nil);
    NSParameterAssert(sourceViewController != nil);

    NSItemProvider * itemProvider = [[NSItemProvider alloc] initWithItem:@{ SatispayPaymentExtensionChargeUUIDKey: UUID }
                                                          typeIdentifier:SatispayPaymentExtensionChargeTypeIdentifier];

    NSExtensionItem * extensionItem = [NSExtensionItem new];
    extensionItem.attachments = @[ itemProvider ];

    UIActivityViewController * controller = [self activityViewControllerForExtensionItem:extensionItem
                                                                                  sender:sender];

    controller.completionWithItemsHandler = ^(NSString * activityType, BOOL completed, NSArray * returnedItems, NSError * activityError) {

        if (activityError) {
            if (completion) {
                completion(activityError);
            }

            return;
        }

        if (completion) {
            completion(nil);
        }

        return;

    };

    [sourceViewController presentViewController:controller animated:YES completion:nil];

}

- (UIActivityViewController *)activityViewControllerForExtensionItem:(nonnull NSExtensionItem *)extensionItem
                                                              sender:(nullable id)sender {

    NSAssert(NO == (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && sender == nil), @"sender must not be nil on iPad.");

    UIActivityViewController * controller = [[UIActivityViewController alloc] initWithActivityItems:@[ extensionItem ]
                                                                              applicationActivities:nil];

    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        controller.popoverPresentationController.barButtonItem = sender;
    } else if ([sender isKindOfClass:[UIView class]]) {
        controller.popoverPresentationController.sourceView = [sender superview];
        controller.popoverPresentationController.sourceRect = [sender frame];
    }

    return controller;

}

@end
