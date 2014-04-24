//
//  TSPickerController.h
//  taishop
//
//  Created by Ralph Li on 1/6/14.
//  Copyright (c) 2014 taishop. All rights reserved.
//

#import "MMTableViewController.h"

@interface MMPickerItem : NSObject

@property (nonatomic, assign) NSInteger itemID;
@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) id itemValue;

@end

@class MMPickerController;

@protocol MMPickerControllerDelegate <NSObject>

@optional
- (void)pickerController:(MMPickerController*)picker didSelectItem:(MMPickerItem*)item;

@end


@interface MMPickerController : MMTableViewController

@property (nonatomic,strong) NSArray *itemArray;
@property (nonatomic,weak) id<MMPickerControllerDelegate> delegate;

@end
