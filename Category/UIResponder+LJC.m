//
//  UIResponder+LJC.m
//  traffic
//
//  Created by Ralph Li on 12/11/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "UIResponder+LJC.h"


static BOOL hasAlreadyCachedKeyboard;
static __weak id currentFirstResponder;

@interface UIResponder (KeyboardCache_Private)
+(void) __cacheKeyboard;
@end


@implementation UIResponder (LJC)


+(id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

-(void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}


+(void) cacheKeyboard {
    [[self class] cacheKeyboard:NO];
}

+(void) cacheKeyboard:(BOOL)onNextRunloop {
    if (! hasAlreadyCachedKeyboard)
    {
        hasAlreadyCachedKeyboard = YES;
        if (onNextRunloop)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.0), dispatch_get_main_queue(), ^(void){ [[self class] __cacheKeyboard]; });
        else
            [[self class] __cacheKeyboard];
    }
}

+(void) __cacheKeyboard {
    UITextField *field = [UITextField new];
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:field];
    [field becomeFirstResponder];
    [field resignFirstResponder];
    [field removeFromSuperview];
}

@end
