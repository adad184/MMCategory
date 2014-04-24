//
//  TSTableViewController.m
//  taishop
//
//  Created by Ralph Li on 1/2/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMTableViewController.h"

@interface MMTableViewController ()

@end

@implementation MMTableViewController

- (id)init
{
    return [self initWithTableStyle:UITableViewStylePlain];
}

- (id)initWithTableStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:style];
        [self.tableView setAutoresizingMask:FixedALL];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.tableView];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewWillBeginDragging:)];
        tap.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:tap];
        
        [self configureBlock];
        [self configureForm];
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

- (void)dealloc
{
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)configureBlock
{
    
}

- (void)configureForm
{
    
}

@end
