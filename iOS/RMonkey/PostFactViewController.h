//
//  PostFactViewController.h
//  RMonkey
//
//  Created by Malvik Chhatbar on 2013-03-11.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostFactViewController : UIViewController <UIAlertViewDelegate, UITextViewDelegate>

@property(strong, nonatomic) IBOutlet UIImageView *appBackground;
@property(strong, nonatomic) IBOutlet UITextView *inputFactTextField;
@property (nonatomic) BOOL emptypost;

-(IBAction)postFact:(id)sender;

@end
