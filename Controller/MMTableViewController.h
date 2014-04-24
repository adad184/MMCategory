//
//  TSTableViewController.h
//  taishop
//
//  Created by Ralph Li on 1/2/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMViewController.h"

@interface MMTableViewController : MMViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

- (id) initWithTableStyle:(UITableViewStyle)style;

- (void) configureBlock;
- (void) configureForm;

@end
