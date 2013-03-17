//
//  BubbleTypeTableViewController.h
//  RMonkey
//
//  Created by Hardeep Nijher on 2013-03-10.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleTypeTableViewController : UITableViewController

@property(nonatomic,strong) IBOutlet UITableViewCell *normalBubbleCell;
@property(nonatomic,strong) IBOutlet UITableViewCell *cloudBubbleCell;
@property(nonatomic,strong) IBOutlet UITableViewCell *starBubbleCell;

@end
