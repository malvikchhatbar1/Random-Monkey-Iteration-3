//
//  FontAndColorTableViewController.m
//  RMonkey
//
//  CPS 630 - Web Applications Project
//  Created by Hardeep Nijher on 2013-03-10.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "FontAndColorTableViewController.h"
#import "AppDelegate.h"

@interface FontAndColorTableViewController ()

@end

@implementation FontAndColorTableViewController

@synthesize font1Cell = _font1Cell;
@synthesize font2Cell = _font2Cell;
@synthesize font3Cell = _font3Cell;

@synthesize color1Cell = _color1Cell;
@synthesize color2Cell = _color2Cell;
@synthesize color3Cell = _color3Cell;
@synthesize color4Cell = _color4Cell;

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
    
    if([mainDelegate.fontType isEqualToString:@"font1"]) {
        [self.font1Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.font2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.font3Cell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else if([mainDelegate.fontType isEqualToString:@"font2"]) {
        [self.font2Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.font1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.font3Cell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else { //font 3
        [self.font3Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.font1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.font2Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    
    if([mainDelegate.fontColor isEqualToString:@"color1"]) {
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else if([mainDelegate.fontColor isEqualToString:@"color2"]) {
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else if([mainDelegate.fontColor isEqualToString:@"color3"]) {
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryNone];
        
    }
    else { //color 4
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use the SearchBeginningOfLine variable
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(selectedCell == self.font1Cell) {
        mainDelegate.fontType = @"font1";
        
        [self.font1Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.font2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.font3Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    if(selectedCell == self.font2Cell) {
        mainDelegate.fontType = @"font2";
        
        [self.font2Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.font1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.font3Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    if(selectedCell == self.font3Cell) {
        mainDelegate.fontType = @"font3";
        
        [self.font3Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.font1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.font2Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    
    if(selectedCell == self.color1Cell) {
        mainDelegate.fontColor = @"color1";
        
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    if(selectedCell == self.color2Cell) {
        mainDelegate.fontColor = @"color2";
        
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    if(selectedCell == self.color3Cell) {
        mainDelegate.fontColor = @"color3";
        
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    if(selectedCell == self.color4Cell) {
        mainDelegate.fontColor = @"color4";
        
        [self.color4Cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.color1Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color2Cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.color3Cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    [[self tableView] reloadData];
}

@end
