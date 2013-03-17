//
//  ViewController.h
//  RMonkey
//
//  Created by Hardeep Nijher on 2013-03-03.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView * loadingIndicator;
@property (nonatomic, strong) NSArray * jsonArray;

@property(strong, nonatomic) IBOutlet UIButton *buttonShow;
@property(strong, nonatomic) IBOutlet UIButton *buttonPause;
@property(strong, nonatomic) IBOutlet UIButton *buttonMenu;
@property(strong, nonatomic) IBOutlet UILabel *labelFact;

@property(strong, nonatomic) IBOutlet UIImageView *appBackground;

@property(strong, nonatomic) IBOutlet UIImageView *bubble;

@property(strong, nonatomic) IBOutlet UIImageView *monkey;

@property(strong, nonatomic) IBOutlet UIImageView *banana;

@property(strong, nonatomic) IBOutlet UIImageView *trashcan;

-(IBAction)buttonShowFunction:(id)sender;
-(IBAction)buttonPauseFunction:(id)sender;

@end
