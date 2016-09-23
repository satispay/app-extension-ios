//
//  SatispayExtension.h
//  SatispayAppExtension
//
//  Created by Pierluigi D'Andrea on 18/07/16.
//  Copyright © 2016 Satispay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Domain of errors the app extension sends in reply to failed payment requests.
 */
extern NSString * __nonnull const SatispayPaymentExtensionErrorDomain;

/**
 *  Error codes for the domain `SatispayPaymentExtensionErrorDomain`.
 */
typedef NS_ENUM(NSInteger, SatispayPaymentExtensionErrorCode) {
    /**
     *  The arguments (`UUID`) passed to the extension are not valid.
     */
    SatispayPaymentExtensionErrorCodeInvalidArgument = 1,
    /**
     *  The user is not currently logged into Satispay.
     */
    SatispayPaymentExtensionErrorCodeNotLoggedIn,
    /**
     *  The authentication failed.
     */
    SatispayPaymentExtensionErrorCodeAuthFailed,
    /**
     *  No online charge was found with the given UUID.
     */
    SatispayPaymentExtensionErrorCodeChargeNotFound
};

@interface SatispayExtension : NSObject

/**
 *  Verifies if the payment through the Satispay app extension is supported.
 *
 *  @note The method relies on `[UIApplication canOpenURL]` to check if the app extension is installed.
 *  For this reason (on iOS 9+) the app that calls this method is required to add the `satispay-appextension-feature-online-charge://` url 
 *  to the `LSApplicationQueriesSchemes` key in its Info.plist.
 *
 *  @remark In case the app extension is not available, the application is responsible for opening Satispay and letting the user complete the transaction.
 *
 *  To open Satispay, the following URL schemes are available:
 *
 *      - `satispay://`: production
 *
 *      - `satispay-stag://`: staging
 *
 *  @return YES if the payment through the app extension is supported, NO otherwise.
 */
+ (BOOL)isExtensionSupported;

/**
 *  Handles the payment of an online charge.
 *
 *  @note The method takes care of presenting the `UIActivityViewController` on `sourceViewController` and 
 *  passing all the required parameters to the app extension.
 *
 *  @param UUID                 UUID of the pending charge.
 *  @param sourceViewController View controller that presentes the `UIActivityViewController`.
 *  @param sender               On iPad the sender of the `UIActivityViewController` presentation.
 *  @param completion           Called when the payment is complete. In case the payment failed with an error, the `error` parameter is not nil.
 */
- (void)requestPaymentOfChargeWithUUID:(nonnull NSString *)UUID
                    fromViewController:(nonnull UIViewController *)sourceViewController
                                sender:(nullable id)sender
                            completion:(nullable void (^)(NSError * __nullable error))completion;

@end
