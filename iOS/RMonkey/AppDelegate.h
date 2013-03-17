//
//  AppDelegate.h
//  RMonkey
//
//  Created by Hardeep Nijher on 2013-03-03.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableData * data;
@property (nonatomic, strong) NSMutableArray * factArray;

@property (nonatomic, strong) NSMutableArray * localfactArray;

@property (nonatomic, strong) NSString * bubbleType;
@property (nonatomic) BOOL changedBubbleType;

@property (nonatomic, strong) NSString * fontType;
@property (nonatomic, strong) NSString * fontColor;

@property (nonatomic,strong) AVAudioPlayer * audioPlayer; //audio player that will control the background music
@property (nonatomic) BOOL backgroundMusicSwitchOn;

@property (nonatomic, strong) NSString * currentFact;

@end
