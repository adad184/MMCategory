//
//  TSViewController.h
//  taishop
//
//  Created by Ralph Li on 12/27/13.
//  Copyright (c) 2013 taishop. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MMViewStatusType) {
    MMViewStatusTypeLoaded,
    MMViewStatusTypeLoading,
    MMViewStatusTypeRetry,
    MMViewStatusTypeFailed,
    MMViewStatusTypeMax = 999
};

@interface MMViewController : UIViewController

@property (nonatomic, assign) BOOL showDismissButton;
@property (nonatomic, assign) BOOL isPoppingOut;
@property (nonatomic, assign) BOOL isFirstLoaded;
@property (nonatomic, assign) NSInteger bindTag;
@property (nonatomic, weak) id bindObject;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) MMViewStatusType viewStatus;

- (void)setBackButton;
- (void)actionBack;

- (void) pushController:(UIViewController*)vc;
- (void) presentController:(UIViewController*)vc;
- (void) popController;
- (void) dismissController;

- (void)actionKeyboardShow:(NSNotification *)notification;
- (void)actionKeyboardHide:(NSNotification *)notification;

- (void)setViewStatusType:(MMViewStatusType)type msg:(NSString*)msg;
- (void)setViewStatusTarget:(id)target action:(SEL)action;

@end
