//
//  TSNavController.h
//  taishop
//
//  Created by Ralph Li on 12/30/13.
//  Copyright (c) 2013 taishop. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMNavController;

@protocol MMNavigationDelegate <NSObject>
@optional
- (BOOL)disablePanPopAtPoint:(CGPoint)point;
- (void)navigationControllerTriggeredPop:(MMNavController *)nc;
- (void)navigationControllerWillPop:(MMNavController *)nc;
- (void)navigationControllerDidPop:(MMNavController *)nc;
@required
@end

@interface MMNavController : UINavigationController
<
UIGestureRecognizerDelegate,
UINavigationControllerDelegate
>
@property (nonatomic, assign) BOOL disablePanPop;

@end
