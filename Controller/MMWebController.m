//
//  MMWebController.m
//  taishop
//
//  Created by Ralph Li on 1/18/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMWebController.h"

@interface MMWebController ()

@end

@implementation MMWebController


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.webView = [[UIWebView alloc] initWithFrame:self.contentView.bounds];
        self.webView.autoresizingMask = FixedALL;
        self.webView.delegate = self;
        [self.contentView addSubview:self.webView];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
