//
//  TSScrollViewController.m
//  taishop
//
//  Created by Ralph Li on 1/9/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMScrollViewController.h"

@interface MMScrollViewController ()

@end

@implementation MMScrollViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.contentView.bounds];
        self.scrollView.autoresizingMask = FixedALL;
        self.scrollView.delegate = self;
        self.scrollView.backgroundColor = self.view.backgroundColor;
        self.scrollView.alwaysBounceVertical = YES;
        [self.contentView addSubview:self.scrollView];
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewWillBeginDragging:)];
        tap.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:tap];
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

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end
