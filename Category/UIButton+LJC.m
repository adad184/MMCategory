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

- (void)setImageN:(NSString *)n
{
    [self setImageN:n H:nil D:nil S:nil];
}

- (void) setImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s
{
    [self setImage:n?[UIImage imageName:n]:nil forState:UIControlStateNormal];
    [self setImage:h?[UIImage imageName:h]:nil forState:UIControlStateHighlighted];
    [self setImage:d?[UIImage imageName:d]:nil forState:UIControlStateDisabled];
    [self setImage:s?[UIImage imageName:s]:nil forState:UIControlStateSelected];
    [self setImage:(s&&h)?[UIImage imageName:h]:nil forState:UIControlStateHighlighted | UIControlStateSelected];
    
    [self setImageN:n H:h D:d S:s HS:((s&&h)?h:nil)];
    
}

- (void) setImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s HS:(NSString *)hs
{
    [self setImage:n?[UIImage imageName:n]:nil forState:UIControlStateNormal];
    [self setImage:h?[UIImage imageName:h]:nil forState:UIControlStateHighlighted];
    [self setImage:d?[UIImage imageName:d]:nil forState:UIControlStateDisabled];
    [self setImage:s?[UIImage imageName:s]:nil forState:UIControlStateSelected];
    [self setImage:hs?[UIImage imageName:hs]:nil forState:UIControlStateHighlighted | UIControlStateSelected];
    
}


- (void) setBackgroundImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s
{
    
    [self setBackgroundImage:n?[[UIImage imageName:n] stretched]:nil forState:UIControlStateNormal];
    [self setBackgroundImage:h?[[UIImage imageName:h] stretched]:nil forState:UIControlStateHighlighted];
    [self setBackgroundImage:d?[[UIImage imageName:d] stretched]:nil forState:UIControlStateDisabled];
    [self setBackgroundImage:s?[[UIImage imageName:s] stretched]:nil forState:UIControlStateSelected];
    [self setBackgroundImage:(s&&h)?[[UIImage imageName:h] stretched]:nil forState:UIControlStateHighlighted | UIControlStateSelected];
}


@end
