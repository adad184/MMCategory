//
//  UITableView+LJC.m
//  traffic
//
//  Created by Ralph Li on 12/19/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "UITableView+LJC.h"

@implementation UITableView (LJC)

- (void)scrollToView:(UIView *)v
{
    if ( v && [self haveSubview:v] )
    {
        while ( v && ![[v class] isSubclassOfClass:[self class]]) {
            v = v.superview;
        }
        
        if ( v )
        {
            UITableViewCell *cell = (UITableViewCell*)v;
            
            [self scrollToRowAtIndexPath:[self indexPathForRowAtPoint:cell.center] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }
    }
}

@end
