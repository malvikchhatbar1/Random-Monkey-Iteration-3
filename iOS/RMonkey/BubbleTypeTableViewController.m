//
//  BubbleTypeTableViewController.m
//  RMonkey
//
//  CPS 630 - Web Applications Project
//  Created by Hardeep Nijher on 2013-03-10.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "BubbleTypeTableViewController.h"
#import "AppDelegate.h"

@interface BubbleTypeTableViewController ()

@end

@implementation BubbleTypeTableViewController

@synthesize normalBubbleCell = _normalBubbleCell;
@synthesize cloudBubbleCell = _cloudBubbleCell;
@synthesize starBubbleCell = _starBubbleCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:(BOOL)animated];
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if([mainDelegate.bubbleType isEqualToString:@"star"]) {
        [self.starBubbleCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.cloudBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        [self.normalBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else if([mainDelegate.bubbleType isEqualToString:@"cloud"]) {
        [self.cloudBubbleCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.starBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        [self.normalBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else { //normal bubble selected
        [self.normalBubbleCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.starBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        [self.cloudBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use the SearchBeginningOfLine variable
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(selectedCell == self.normalBubbleCell) { //selected cell is "normal bubble"
        mainDelegate.bubbleType = @"normal";
        
        [self.normalBubbleCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.starBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        [self.cloudBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        
        mainDelegate.changedBubbleType = TRUE;
        //NSArray *array = [self.navigationController viewControllers];
        //[self.navigationController popToViewController:[array objectAtIndex:1] animated:YES];
    }
    
    if(selectedCell == self.cloudBubbleCell) { //selected cell is "cloud bubble"
        mainDelegate.bubbleType = @"cloud";
        
        [self.cloudBubbleCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.starBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        [self.normalBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        
        mainDelegate.changedBubbleType = TRUE;
        //NSArray *array = [self.navigationController viewControllers];
        //[self.navigationController popToViewController:[array objectAtIndex:1] animated:YES];
    }
    
    if(selectedCell == self.starBubbleCell) { //selected cell is "star bubble"
        mainDelegate.bubbleType = @"star";
        
        [self.starBubbleCell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.cloudBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        [self.normalBubbleCell setAccessoryType:UITableViewCellAccessoryNone];
        
        mainDelegate.changedBubbleType = TRUE;
        //NSArray *array = [self.navigationController viewControllers];
        //[self.navigationController popToViewController:[array objectAtIndex:1] animated:YES];
    }
    
    [[self tableView] reloadData];
}

@end
