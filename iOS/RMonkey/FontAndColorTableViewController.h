//
//  FontAndColorTableViewController.h
//  RMonkey
//
//  Created by Hardeep Nijher on 2013-03-10.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontAndColorTableViewController : UITableViewController

@property(nonatomic,strong) IBOutlet UITableViewCell *font1Cell;
@property(nonatomic,strong) IBOutlet UITableViewCell *font2Cell;
@property(nonatomic,strong) IBOutlet UITableViewCell *font3Cell;

@property(nonatomic,strong) IBOutlet UITableViewCell *color1Cell;
@property(nonatomic,strong) IBOutlet UITableViewCell *color2Cell;
@property(nonatomic,strong) IBOutlet UITableViewCell *color3Cell;
@property(nonatomic,strong) IBOutlet UITableViewCell *color4Cell;

@end
