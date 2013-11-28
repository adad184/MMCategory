//
//  UIAlertView+LJC.h
//  LJC
//
//  Created by Ralph Li on 4/1/13.
//  Copyright (c) 2013 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (LJC)


typedef void(^UIAlertViewHandler)(UIAlertView *alertView, NSInteger buttonIndex);



/**
 * Shows the receiver alert with the given handler.
 *
 * @param handler The handler that will be invoked in user interaction.
 */
- (void)showWithHandler:(UIAlertViewHandler)handler;

/**
 * Utility selector to show an alert with a title, a message and a button to dimiss.
 *
 * @param title The title of the alert.
 * @param message The message to show in the alert.
 * @param handler The handler that will be invoked in user interaction.
 */
+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
              handler:(UIAlertViewHandler)handler;

/**
 * Utility selector to show an alert with an "Error" title, a message and a button to dimiss.
 *
 * @param message The message to show in the alert.
 * @param handler The handler that will be invoked in user interaction.
 */
+ (void)showErrorWithMessage:(NSString *)message
                     handler:(UIAlertViewHandler)handler;

/**
 * Utility selector to show an alert with a "Warning" title, a message and a button to dimiss.
 *
 * @param message The message to show in the alert.
 * @param handler The handler that will be invoked in user interaction.
 */
+ (void)showWarningWithMessage:(NSString *)message
                       handler:(UIAlertViewHandler)handler;

/**
 * Utility selector to show a confirmation dialog with a title, a message and two buttons to accept or cancel.
 *
 * @param title The title of the alert.
 * @param message The message to show in the alert.
 * @param handler The handler that will be invoked in user interaction.
 */
+ (void)showConfirmationDialogWithTitle:(NSString *)title
                                message:(NSString *)message
                                handler:(UIAlertViewHandler)handler;




@end
