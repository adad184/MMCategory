//
//  MBProgressHUD+LJC.m
//  traffic
//
//  Created by Ralph Li on 12/16/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "MBProgressHUD+LJC.h"

@implementation MBProgressHUD (LJC)

- (void) hideWithTitle:(NSString*)title detail:(NSString*)detail
{
    [self hideWithTitle:title detail:detail delay:1];
}

- (void) hideWithTitle:(NSString*)title detail:(NSString*)detail delay:(NSInteger)delay
{
    self.mode = MBProgressHUDModeText;
    self.labelText = title;
    self.detailsLabelText = detail;
    [self hide:YES afterDelay:delay];
}

@end
