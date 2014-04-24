//
//  UIButton+LJC.m
//  LJC
//
//  Created by Ralph Li on 12-5-31.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import "UIButton+LJC.h"

@implementation UIButton (LJC)

+ (UIButton*) buttonWithTarget:(id)target action:(SEL)sel
{
    UIButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void) setTextN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s
{
    if ( n )
    {
        [self setTitle:n forState:UIControlStateNormal];
    }
    
    if ( h )
    {
        [self setTitle:h forState:UIControlStateHighlighted];
    }
    
    if ( d )
    {
        [self setTitle:d forState:UIControlStateDisabled];
    }
    
    if ( s )
    {
        [self setTitle:s forState:UIControlStateSelected];
    }
}

- (void) setImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s
{
    if ( n )
    {
        [self setImage:[UIImage imageName:n] forState:UIControlStateNormal];
    }
    
    if ( h )
    {
        [self setImage:[UIImage imageName:h] forState:UIControlStateHighlighted];
    }
    
    if ( d )
    {
        [self setImage:[UIImage imageName:d] forState:UIControlStateDisabled];
    }
    
    if ( s )
    {
        [self setImage:[UIImage imageName:s] forState:UIControlStateSelected];
        
        if ( h )
        {
            [self setImage:[UIImage imageName:h] forState:UIControlStateHighlighted | UIControlStateSelected];
        }
        
    }
}


- (void) setBackgroundImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s
{
    if ( n )
    {
        [self setBackgroundImage:[[UIImage imageName:n] stretched] forState:UIControlStateNormal];
    }
    
    if ( h )
    {
        [self setBackgroundImage:[[UIImage imageName:h] stretched] forState:UIControlStateHighlighted];
    }
    
    if ( d )
    {
        [self setBackgroundImage:[[UIImage imageName:d] stretched] forState:UIControlStateDisabled];
    }
    
    if ( s )
    {
        [self setBackgroundImage:[[UIImage imageName:s] stretched] forState:UIControlStateSelected];
        
        if ( h )
        {
            [self setBackgroundImage:[[UIImage imageName:h] stretched] forState:UIControlStateHighlighted | UIControlStateSelected];
        }
        
    }
}


@end
