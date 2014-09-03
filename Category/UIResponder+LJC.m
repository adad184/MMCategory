//
//  UIResponder+LJC.m
//  traffic
//
//  Created by Ralph Li on 12/11/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "UIResponder+LJC.h"
#import <objc/runtime.h>

static char *MMFirstResponderKey = "FirstResponderKey";


static BOOL hasAlreadyCachedKeyboard;
static __weak id currentFirstResponder;

@interface UIResponder (KeyboardCache_Private)
+(void) __cacheKeyboard;
@end


@implementation UIResponder (LJC)


- (id)currentFirstResponder {
    [UIApplication.sharedApplication sendAction:@selector(findFirstResponder:)
                                             to:nil from:self forEvent:nil];
    id obj = objc_getAssociatedObject(self, MMFirstResponderKey);
    objc_setAssociatedObject(self, MMFirstResponderKey, nil, OBJC_ASSOCIATION_ASSIGN);
    return obj;
}

- (void)setCurrentFirstResponder:(id)responder {
    objc_setAssociatedObject(self, MMFirstResponderKey, responder,
                             OBJC_ASSOCIATION_ASSIGN);
}

- (void)findFirstResponder:(id)sender {
    [sender setCurrentFirstResponder:self];
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
