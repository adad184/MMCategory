//
//  UIView+LJC.h
//  
//
//  Created by  on 12-1-13.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>

#define FlexibleT                   UIViewAutoresizingFlexibleTopMargin
#define FlexibleB                   UIViewAutoresizingFlexibleBottomMargin
#define FlexibleL                   UIViewAutoresizingFlexibleLeftMargin
#define FlexibleR                   UIViewAutoresizingFlexibleRightMargin
#define FlexibleH                   UIViewAutoresizingFlexibleHeight
#define FlexibleW                   UIViewAutoresizingFlexibleWidth

#define FixedMarginT                FlexibleW | FlexibleB
#define FixedMarginB                FlexibleW | FlexibleT
#define FixedMarginL                FlexibleH | FlexibleR
#define FixedMarginR                FlexibleH | FlexibleL
#define FixedHorizental             FlexibleW | FlexibleT | FlexibleB
#define FixedVertical               FlexibleH | FlexibleL | FlexibleR
#define FixedALL                    FlexibleW | FlexibleH
#define FixedCenter                 FlexibleL | FlexibleR | FlexibleT | FlexibleB

@interface UIView (LJC)

@property (nonatomic, readonly) UIView* glowView;

+ (UIImageView *) viewWithColor:(UIColor*)color;

- (void) setTagName:(NSString*)name;
- (UIView*) viewWithName:(NSString*)name;
- (void) autoResize:(UIViewAutoresizing) type;
- (void) addToolbar:(UIView*)toolbar;
- (void) setPosition:(CGRect)position;

@property (nonatomic, readonly ) float x;
@property (nonatomic, readonly ) float y;
@property (nonatomic, readonly ) float w;
@property (nonatomic, readonly ) float h;

@end
