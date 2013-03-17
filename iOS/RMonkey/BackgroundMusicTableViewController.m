//
//  BackgroundMusicTableViewController.m
//  RMonkey
//
//  CPS 630 - Web Applications Project
//  Created by Malvik Chhatbar on 2013-03-08.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "BackgroundMusicTableViewController.h"
#import "AppDelegate.h"

@interface BackgroundMusicTableViewController ()

@end

@implementation BackgroundMusicTableViewController

@synthesize backgroundMusicSwitch = _backgroundMusicSwitch;
@synthesize volumeSlider = _volumeSlider;

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
    
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    
    self.volumeSlider.value = mainDelegate.audioPlayer.volume;
    
    if(mainDelegate.backgroundMusicSwitchOn == YES) {
        self.backgroundMusicSwitch.On = YES;
    }
    else {
        self.backgroundMusicSwitch.On = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleaudio:(id)sender {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    
    if (self.backgroundMusicSwitch.on)
    {
        mainDelegate.backgroundMusicSwitchOn = YES;
        [mainDelegate.audioPlayer play];
        mainDelegate.audioPlayer.numberOfLoops = -1;
    }
    else {
        mainDelegate.backgroundMusicSwitchOn = NO;
        [mainDelegate.audioPlayer pause];
    }
    
}

-(IBAction)setBackgroundMusicVolume:(id)sender {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    
    float volume = self.volumeSlider.value;
    mainDelegate.audioPlayer.volume = volume;
}

@end
