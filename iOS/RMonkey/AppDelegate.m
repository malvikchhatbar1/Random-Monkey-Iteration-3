//
//  AppDelegate.m
//  RMonkey
//
//  Created by Hardeep Nijher on 2013-03-03.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize data = _data;
@synthesize factArray = _factArray;

@synthesize localfactArray = _localfactArray;

@synthesize audioPlayer = _audioPlayer;
@synthesize backgroundMusicSwitchOn = _backgroundMusicSwitchOn;

@synthesize bubbleType = _bubbleType;
@synthesize fontColor = _fontColor;
@synthesize fontType = _fontType;

@synthesize currentFact = _currentFact;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    sleep(1.5);
    self.backgroundMusicSwitchOn = NO;
    
    NSURL* soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bg_music" ofType:@"wav"]];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    self.audioPlayer.volume = 0.5;
    
    self.bubbleType = @"normal"; //used in settings menu to set the bubble type. it will be set to either "normal", "cloud" or "star" 
    self.changedBubbleType = FALSE; //used to check to see if user changed the bubble type, if true, then when the show fact view appears, the reloadfact method will automatically be called.
    self.fontType = @"font1"; //used to check which font is selected
    self.fontColor = @"color1"; //used to check which font color is selected
    
    self.currentFact = @"test";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *savedLocalFacts = [[defaults objectForKey:@"localfacts"] mutableCopy]; //KEY
    
    if(savedLocalFacts != nil) { //DATA ALREADY SAVED IN USERDEFAULTS ... just set array from nsuserdefaults to localfactArray
        NSLog(@"savedLocalFacts not equal to nil");
        self.localfactArray = [NSMutableArray arrayWithArray: savedLocalFacts];
    }
    else {
        NSLog(@"savedLocalFacts is nil");
        self.localfactArray = [NSMutableArray array];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"in applicationDidEnterBackground, saving localfactArray to nsuserdfaults. The count of localfactArray is: %u", self.localfactArray.count);
    NSLog(@"localfactArray: %@", self.localfactArray);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.localfactArray forKey:@"localfacts"]; //save newly created nsdictionary into nsuserdefaults
    [defaults synchronize];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
