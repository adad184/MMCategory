//
//  UIScrollView+LJC.m
//  traffic
//
//  Created by Ralph Li on 12/31/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "UIScrollView+LJC.h"

@implementation UIScrollView (LJC)


- (void)scrollToView:(UIView *)v
{
    UIView *ogirinV = v;
    if ( v && [self haveSubview:v] )
    {
        while ( v && ![[v class] isSubclassOfClass:[self class]]) {
            v = v.superview;
        }
        
        if ( v )
        {
            LLLog(@"--- %@",NSStringFromCGRect([self convertRect:ogirinV.bounds fromView:ogirinV]));
            [self scrollRectToVisible:[self convertRect:ogirinV.bounds fromView:ogirinV] animated:YES];
        }
    }
}

- (void)killScroll
{
    CGPoint offset = self.contentOffset;
    offset.x -= 1.0;
    offset.y -= 1.0;
    [self setContentOffset:offset animated:NO];
    offset.x += 1.0;
    offset.y += 1.0;
    [self setContentOffset:offset animated:NO];
}

@end
