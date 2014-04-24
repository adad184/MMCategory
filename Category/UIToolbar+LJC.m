//
//  UIToolbar+LJC.m
//  LJC
//
//  Created by  on 12-6-8.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import "UIToolbar+LJC.h"
#import "UIButton+LJC.h"

@implementation UIToolbar (LJC)

- (void)buildToolbar:(NSArray *)buttons 
              images:(NSArray *)images 
                hasH:(BOOL)hasH 
                hasS:(BOOL)hasS 
                hasD:(BOOL)hasD 
              titles:(NSArray*)titles
{
    NSUInteger count = buttons.count;
    float w = self.frame.size.width/count;
    float h = self.frame.size.height;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for ( NSUInteger i = 0 ; i < count ; ++i )
    {
        NSString *strN = [NSString stringWithFormat:@"%@N.png",[images objectAtIndex:i]];
        NSString *strH = [NSString stringWithFormat:@"%@H.png",[images objectAtIndex:i]];
        NSString *strS = [NSString stringWithFormat:@"%@S.png",[images objectAtIndex:i]];
        NSString *strD = [NSString stringWithFormat:@"%@D.png",[images objectAtIndex:i]];
        
        UIButton *btn = [buttons objectAtIndex:i];
        btn.tag = i;
        btn.frame = CGRectMake(0, 0, w, h);
        
        [btn setImageN:strN H:strH D:strD S:strS];
        
        if ( titles )
        {
            NSString *title = [titles objectAtIndex:i];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.titleLabel.bounds = CGRectMake(0, 0, w, 15);
            btn.titleLabel.textAlignment = NSTextAlignmentRight;
            
            [btn setTitle:title forState:UIControlStateHighlighted];
            [btn setTitle:title forState:UIControlStateSelected];
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            
        }
                
        [array addObject:[[UIBarButtonItem alloc]
                           initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
        
        [array addObject:[[UIBarButtonItem alloc] initWithCustomView:btn]];
    }
    
    [array addObject:[[UIBarButtonItem alloc]
                       initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
    self.items = array;
    
}

@end
