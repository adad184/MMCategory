//
//  TSScrollViewController.h
//  taishop
//
//  Created by Ralph Li on 1/9/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMViewController.h"

@interface MMScrollViewController : MMViewController
<
UIScrollViewDelegate
>

@property (nonatomic, strong) UIScrollView *scrollView;

@end
