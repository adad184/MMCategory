//
//  MBProgressHUD+LJC.h
//  traffic
//
//  Created by Ralph Li on 12/16/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LJC)

- (void) hideWithTitle:(NSString*)label detail:(NSString*)detail;
- (void) hideWithTitle:(NSString*)title detail:(NSString*)detail delay:(NSInteger)delay;

@end
