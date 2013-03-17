//
//  BackgroundMusicTableViewController.h
//  RMonkey
//
//  CPS 630 - Web Applications Project
//  Created by Malvik Chhatbar on 2013-03-08.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundMusicTableViewController : UITableViewController

@property(nonatomic,strong) IBOutlet UISwitch *backgroundMusicSwitch;
@property(nonatomic,strong) IBOutlet UISlider *volumeSlider;

-(IBAction)setBackgroundMusicVolume:(id)sender;

@end
