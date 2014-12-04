//
//  UIView+Masonry+LJC.h
//  driving
//
//  Created by Ralph Li on 9/22/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@interface UIView(Masonry_LJC)

- (void) distributeSpacingHorizontallyWith:(NSArray*)view;
- (void) distributeSpacingVerticallyWith:(NSArray*)view;

@end
