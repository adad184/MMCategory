//
//  MMWebController.h
//  taishop
//
//  Created by Ralph Li on 1/18/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMViewController.h"

@interface MMWebController : MMViewController
<
UIWebViewDelegate
>

@property (nonatomic, strong) UIWebView *webView;

@end
