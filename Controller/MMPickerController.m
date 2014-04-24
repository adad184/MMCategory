//
//  TSPickerController.m
//  taishop
//
//  Created by Ralph Li on 1/6/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMPickerController.h"

@implementation MMPickerItem

@end

@interface MMPickerController ()

@end

@implementation MMPickerController

- (id)init
{
    self = [super initWithTableStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        self.title = @"选择";
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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

- (void)setItemArray:(NSArray *)itemArray
{
    _itemArray = itemArray;
    
    [self.tableView reloadData];
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    MMPickerItem *item = self.itemArray[indexPath.row];
    cell.textLabel.text = item.itemName;
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ( [self.delegate respondsToSelector:@selector(pickerController:didSelectItem:)] )
    {
        [self.delegate pickerController:self didSelectItem:self.itemArray[indexPath.row]];
    }
}


@end
