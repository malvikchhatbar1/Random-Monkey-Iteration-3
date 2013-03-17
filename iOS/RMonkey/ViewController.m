//
//  ViewController.m
//  RMonkey
//  TIMOTHY QUON WAS HERE on 2013-03-17
//  Created by Hardeep Nijher on 2013-03-03.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SystemConfiguration/SystemConfiguration.h"

@interface ViewController ()

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic) BOOL deviceIsiphone5;
@property (nonatomic) BOOL autofeedSelected;
@end

@implementation ViewController

@synthesize loadingIndicator = _loadingIndicator;
@synthesize jsonArray = _jsonArray;

@synthesize buttonShow = _buttonShow;
@synthesize buttonPause = _buttonPause;
@synthesize buttonMenu = _buttonMenu;
@synthesize labelFact = _labelFact;

@synthesize timer = _timer;

@synthesize appBackground = _appBackground;
@synthesize bubble = _bubble;

@synthesize monkey = _monkey;

@synthesize banana = _banana;

@synthesize trashcan = _trashcan;

@synthesize deviceIsiphone5 = _deviceIsiphone5;
@synthesize autofeedSelected = _autofeedSelected;

- (BOOL) connectionIsAvailable
{
	SCNetworkReachabilityFlags flags;
    BOOL receivedFlags;
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(CFAllocatorGetDefault(), [@"www.google.com" UTF8String]);
    receivedFlags = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    
    if (!receivedFlags || (flags == 0) )
    {
        return FALSE;
    } else {
		return TRUE;
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    
    
    self.bubble.hidden = TRUE;
    self.labelFact.hidden = TRUE;
    self.buttonShow.hidden = TRUE;
    self.buttonPause.hidden = TRUE;
    self.buttonMenu.hidden = TRUE;
    
    self.banana.hidden = TRUE;
    self.trashcan.hidden = TRUE;
    
    if ([[UIScreen mainScreen] bounds].size.height == 568) {
        NSLog(@"iphone 5");
        self.deviceIsiphone5 = YES;
        UIImage *image = [UIImage imageNamed:@"appBackground_noMonkey_548.png"];
        [self.appBackground setImage:image];
        self.appBackground.frame = CGRectMake(0, 0, 320, 548);
        
        UIImage *imageMonkey = [UIImage imageNamed:@"monkey_handsDown.png"];
        [self.monkey setImage:imageMonkey]; //initially set monkey to hands down 
    }
    else {
        NSLog(@"not iphone 5");
        self.deviceIsiphone5 = NO;
        UIImage *image = [UIImage imageNamed:@"appBackground_noMonkey.png"];
        [self.appBackground setImage:image];
        self.appBackground.frame = CGRectMake(0, 0, 320, 460);
        
        UIImage *imageMonkey = [UIImage imageNamed:@"monkeyiPhone4_handsDown.png"];
        [self.monkey setImage:imageMonkey]; //initially set monkey to hands down 
    }
    
    self.autofeedSelected = NO;
    
    [self.loadingIndicator startAnimating];
    
    BOOL availableConnection = [self connectionIsAvailable];
    //NSLog(@"connection: %d", availableConnection);
    
    if(availableConnection) {
        NSURL *url = [NSURL URLWithString:[@"http://randommonkey.herokuapp.com/facts.json"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        (void)[[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    else {
        [self.loadingIndicator stopAnimating];
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Internet Connection"
                                  message:@"There is no available internet connection. Please quit the application, check that your Wifi or Data connection is on and try again."
                                  delegate:self
                                  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    mainDelegate.data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    [mainDelegate.data appendData:theData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"finshed");
    
    //now parse json data into fact array
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    
    NSError *e = nil;
    self.jsonArray = [NSJSONSerialization JSONObjectWithData: mainDelegate.data options: NSJSONReadingMutableContainers error: &e];
    
    if (!self.jsonArray) {
        NSLog(@"Error parsing JSON: %@", e);
    }
    else {
        mainDelegate.factArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in self.jsonArray) {
            [mainDelegate.factArray addObject:[dict objectForKey:@"fact"]];
        }
    }
    
    //loop through savedlocalfacts array and append any facts in that to factArray
    for (NSMutableArray *localfacts in mainDelegate.localfactArray) {
        [mainDelegate.factArray addObject:localfacts];
    }
    
    NSLog(@"array: %@", mainDelegate.factArray);
    self.buttonShow.hidden = FALSE;
    self.buttonShow.alpha = 0;
    
    self.buttonPause.hidden = FALSE;
    self.buttonPause.alpha = 0;
    
    self.buttonMenu.hidden = FALSE;
    self.buttonMenu.alpha = 0;
    
    self.trashcan.hidden = FALSE;
    self.trashcan.alpha = 0;
    
    
    if(self.deviceIsiphone5) {
        
        self.buttonShow.frame = CGRectMake(20, 550, 68, 24);
        self.buttonPause.frame = CGRectMake(116, 550, 90, 44);
        self.buttonMenu.frame = CGRectMake(235, 550, 65, 44);
        
        [UIView animateWithDuration:0.8
                         animations:^ {
                             self.buttonShow.frame = CGRectMake(20, 500, 68, 44);
                             self.buttonShow.alpha = 1;
                             
                             self.buttonPause.frame = CGRectMake(116, 500, 90, 44);
                             self.buttonPause.alpha = 1;
                             
                             self.buttonMenu.frame = CGRectMake(235, 500, 65, 44);
                             self.buttonMenu.alpha = 1;
                             
                             self.trashcan.alpha = 1;
                         }];
    }
    else { //device is not iphone 5 ... set location of buttons differently
        self.buttonShow.frame = CGRectMake(20, 490, 68, 24);
        self.buttonPause.frame = CGRectMake(116, 490, 90, 44);
        self.buttonMenu.frame = CGRectMake(235, 490, 65, 44);
        
        [UIView animateWithDuration:0.8
                         animations:^ {
                             self.buttonShow.frame = CGRectMake(20, 412, 68, 44);
                             self.buttonShow.alpha = 1;
                             
                             self.buttonPause.frame = CGRectMake(116, 412, 90, 44);
                             self.buttonPause.alpha = 1;
                             
                             self.buttonMenu.frame = CGRectMake(235, 412, 65, 44);
                             self.buttonMenu.alpha = 1;
                             
                             self.trashcan.alpha = 1;
                         }];
    }
    
    [self.loadingIndicator stopAnimating];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    
    
    if([mainDelegate.fontType isEqualToString:@"font1"]) {
       [self.labelFact setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0f]];
    }
    if([mainDelegate.fontType isEqualToString:@"font2"]) {
        [self.labelFact setFont:[UIFont fontWithName:@"BradleyHandITCTT-Bold" size:17.0f]];
    }
    if([mainDelegate.fontType isEqualToString:@"font3"]) {
        [self.labelFact setFont:[UIFont fontWithName:@"Georgia" size:17.0f]];
    }
    
    
    if([mainDelegate.fontColor isEqualToString:@"color1"]) {
        self.labelFact.textColor = [UIColor blackColor];
    }
    if([mainDelegate.fontColor isEqualToString:@"color2"]) {
        self.labelFact.textColor = [UIColor blueColor];
    }
    if([mainDelegate.fontColor isEqualToString:@"color3"]) {
        self.labelFact.textColor = [UIColor brownColor];
    }
    if([mainDelegate.fontColor isEqualToString:@"color4"]) {
        self.labelFact.textColor = [UIColor redColor];
    }
    
    
    if([mainDelegate.bubbleType isEqualToString:@"normal"]) {
        UIImage *image = [UIImage imageNamed:@"bubble.png"];
        [self.bubble setImage:image];
    }
    
    if ([mainDelegate.bubbleType isEqualToString:@"cloud"]) {
        UIImage *image = [UIImage imageNamed:@"cloud_bubble.png"];
        [self.bubble setImage:image];
    }
    
    if ([mainDelegate.bubbleType isEqualToString:@"star"]) {
        UIImage *image = [UIImage imageNamed:@"star_bubble.png"];
        [self.bubble setImage:image];
    }
    //NSLog(@"%@", mainDelegate.bubbleType);
    
    if(mainDelegate.changedBubbleType) { //check to see if user changed the bubble type, if true, then reload a fact. QUESTION: should we make this function reload the same fact or just a random one?
        
        mainDelegate.changedBubbleType = FALSE;
        [self performSelector:@selector(updateFact) withObject:nil afterDelay:0.05]; //introduce a very small delay before calling the updateFact function to allow enough time for the navigationbar to hide and therefore allow the correct calculation and placement of the bubble when it comes down.
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.autofeedSelected == YES) {
        [self.buttonPause setImage:[UIImage imageNamed:@"autoplay_button.png"] forState:UIControlStateNormal];
        self.autofeedSelected = NO;
        [self.timer invalidate];
        self.buttonShow.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateFact {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
    
    if(self.deviceIsiphone5) {
        
        if(self.autofeedSelected == YES) {
            UIImage *image = [UIImage imageNamed:@"bananas.png"];
            [self.banana setImage:image];
        }
        else {
            UIImage *image = [UIImage imageNamed:@"banana.png"];
            [self.banana setImage:image];
        }
        self.banana.frame = CGRectMake(273, 256, 27, 24);
        self.banana.hidden = FALSE;
        self.banana.alpha = 1;
        [UIView animateWithDuration:0.7
                         animations:^ {
                             self.banana.frame = CGRectMake(273, 367, 27, 24);
                             self.banana.alpha = 0;
                         }];
        
        int monkeytype = arc4random() % 2;
        int monkeyposition = arc4random() % 4;
        //NSLog(@"monkeytype: %d", monkeytype);
        //NSLog(@"monkeyposition: %d", monkeyposition);
        
        if(monkeytype == 0){
            UIImage *image = [UIImage imageNamed:@"monkey_handsUp.png"];
            [self.monkey setImage:image];
        }
        else {
            UIImage *image = [UIImage imageNamed:@"monkey_handsUpFlipped.png"];
            [self.monkey setImage:image];
        }
        
        switch(monkeyposition) {
            case 0:
                self.monkey.frame = CGRectMake(0, 256, 205, 228);
                break;
            case 1:
                self.monkey.frame = CGRectMake(20, 234, 205, 228);
                break;
            case 2:
                self.monkey.frame = CGRectMake(59, 264, 205, 228);
                break;
            case 3:
                self.monkey.frame = CGRectMake(59, 221, 205, 228);
                break;
        }
    }
    else { //iphone 4 or below
        
        int monkeytype = arc4random() % 2;
        int monkeyposition = arc4random() % 3;
        //NSLog(@"monkeytype: %d", monkeytype);
        //NSLog(@"monkeyposition: %d", monkeyposition);
        
        if(monkeytype == 0){
            UIImage *image = [UIImage imageNamed:@"monkeyiPhone4_handsUp.png"];
            [self.monkey setImage:image];
        }
        else {
            UIImage *image = [UIImage imageNamed:@"monkeyiPhone4_handsUpFlipped.png"];
            [self.monkey setImage:image];
        }
        
        switch(monkeyposition) {
            case 0:
                self.monkey.frame = CGRectMake(47, 176, 205, 228);
                break;
            case 1:
                self.monkey.frame = CGRectMake(0, 176, 205, 228);
                break;
            case 2:
                self.monkey.frame = CGRectMake(77, 186, 205, 228);
                break;
        }
    }
    
    int lowerBound = 0;
    int upperBound = ([mainDelegate.factArray count]);
    
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    NSLog(@"%@",[mainDelegate.factArray objectAtIndex:rndValue]);
    
    self.labelFact.text = [NSString stringWithFormat: @"%@", [mainDelegate.factArray objectAtIndex:rndValue]];
    mainDelegate.currentFact = self.labelFact.text; //save the current fact so we can post it to facebook or twitter
    
    self.bubble.hidden = FALSE;
    self.labelFact.hidden = FALSE;
    self.bubble.frame = CGRectMake(0, -50, 320, 170);
    self.labelFact.frame = CGRectMake(40, -40, 240, 80);
    self.bubble.alpha = 0;
    [UIView animateWithDuration:1.2
                     animations:^ {
                         if([mainDelegate.bubbleType isEqualToString:@"star"]) {
                             NSLog(@"in if");
                             self.bubble.frame = CGRectMake(0, 64, 320, 170); 
                         }
                         else {
                             self.bubble.frame = CGRectMake(0, 78, 320, 170);
                         }
                         self.labelFact.frame = CGRectMake(40, 101, 240, 80); //self.labelFact.frame = CGRectMake(39, 123, 240, 80); 
                         self.bubble.alpha = 1;
                     }];
}

-(IBAction)buttonShowFunction:(id)sender {
    [self updateFact]; //grab a random fact from fact array, update the uilabel and animate
}

-(IBAction)buttonPauseFunction:(id)sender {
    if (self.autofeedSelected == NO) {
        [self.buttonPause setImage:[UIImage imageNamed:@"pause_button.png"] forState:UIControlStateNormal];
        self.autofeedSelected = YES;
        self.buttonShow.enabled = NO;
        [self updateFact];
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 3.0 target: self selector: @selector(updateFact) userInfo: nil repeats: YES];
    }
    else {
        [self.buttonPause setImage:[UIImage imageNamed:@"autoplay_button.png"] forState:UIControlStateNormal];
        self.autofeedSelected = NO;
        [self.timer invalidate];
        self.buttonShow.enabled = YES;
    }
}

@end
