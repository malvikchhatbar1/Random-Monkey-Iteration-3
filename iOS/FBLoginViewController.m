//
//  FBLoginViewController.m
//  RMonkey
//
//  Created by Malvik Chhatbar on 2013-03-08.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "FBLoginViewController.h"
#import "AppDelegate.h"

@interface FBLoginViewController ()

@end

@implementation FBLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)postOnFacebookButtonTapped:(id)sender {
    
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbComposer = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        //set the initial text message
        NSString *FactToPost = mainDelegate.currentFact;
        FactToPost = [FactToPost stringByAppendingString:@" - Fact via Random Monkey for iOS"];
        [fbComposer setInitialText: FactToPost];
        
        //present the composer to the user
        [self presentViewController:fbComposer animated:YES completion:nil];
        
    }
    
    else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Facebook Error"
                                  message:@"You may not have set up the facebook service on your device or you may not be connected to the internet. Please check."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}

-(IBAction)tweetButtonTapped:(id)sender {
    
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *twitterComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        //add initial text
        NSString *FactToPost = mainDelegate.currentFact;
        FactToPost = [FactToPost stringByAppendingString:@" - Fact via Random Monkey for iOS"];
        [twitterComposer setInitialText: FactToPost];
        
        //present composer
        [self presentViewController:twitterComposer animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"twitter Error"
                                  message:@"You may not have set up the twitter service on your device or you may not be connected to the internet. Please check."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}

@end
