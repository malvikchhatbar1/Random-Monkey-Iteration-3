//
//  PostFactViewController.m
//  RMonkey
//
//  Created by Malvik Chhatbar on 2013-03-11.
//  Copyright (c) 2013 Team 13. All rights reserved.
//

#import "PostFactViewController.h"
#import "AppDelegate.h"

@interface PostFactViewController ()

@property (nonatomic) BOOL firstTimeEditing;

@end

@implementation PostFactViewController

@synthesize appBackground = _appBackground;
@synthesize inputFactTextField = _inputFactTextField;
@synthesize emptypost = _emptypost;

@synthesize firstTimeEditing = _firstTimeEditing;

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
    
    self.firstTimeEditing = YES;
    [self.inputFactTextField setDelegate:self];
    
    if ([[UIScreen mainScreen] bounds].size.height == 568) {
        NSLog(@"iphone 5");
        UIImage *image = [UIImage imageNamed:@"postBackground_504.png"];
        [self.appBackground setImage:image];
        self.appBackground.frame = CGRectMake(0, 0, 320, 548);
    }
    else {
        NSLog(@"not iphone 5");
        UIImage *image = [UIImage imageNamed:@"postBackground.png"];
        [self.appBackground setImage:image];
        self.appBackground.frame = CGRectMake(0, 0, 320, 460);
        
    }
    
    self.emptypost = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)postFact:(id)sender {
    
    [self.inputFactTextField resignFirstResponder];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Post a Fact"
                              message:@"Are you sure you want to submit this fact?"
                              delegate:self
                              cancelButtonTitle:nil otherButtonTitles:@"Yes", @"No", nil];
    alertView.tag = 1;
    [alertView show];
    
    
    
    
    
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    
    if ((actionSheet.tag == 1) && buttonIndex == 0 && ![self.inputFactTextField.text isEqualToString:@""] && ![self.inputFactTextField.text isEqualToString:@"Tap here to write a fact!"]) {
        AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate]; // access the AppDelegate to use its variables
        
        NSString *factToAdd = [NSString stringWithFormat:@""];
        factToAdd = [factToAdd stringByAppendingString:self.inputFactTextField.text];
        factToAdd = [factToAdd stringByAppendingString:[NSString stringWithFormat:@" "]];
    
        [mainDelegate.factArray addObject:factToAdd];
        [mainDelegate.localfactArray addObject:factToAdd]; // add copy of fact to local array so the app can save it
        NSLog(@"localfactArray: %@", mainDelegate.localfactArray);
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Post a Fact"
                                  message:@"Fact sucessfully posted, thanks!"
                                  delegate:self
                                  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alertView.tag = 3;
        [alertView show];
        
    }
    else if((actionSheet.tag == 1) && [self.inputFactTextField.text isEqualToString:@""] && !buttonIndex == 1) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Post a Fact"
                                  message:@"You didn't write anything! Please type a fact and then press Post!"
                                  delegate:self
                                  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alertView.tag = 2;
        [alertView show];
    }
    else if((actionSheet.tag == 1) && [self.inputFactTextField.text isEqualToString:@"Tap here to write a fact!"] && !buttonIndex == 1) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Post a Fact"
                                  message:@"You didn't write anything! Please type a fact and then press Post!"
                                  delegate:self
                                  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        alertView.tag = 2;
        [alertView show];
    }
    else {
        self.inputFactTextField.text = @"Tap here to write a fact!";
        self.firstTimeEditing = TRUE;
    }
}

- (void) textViewDidBeginEditing:(UITextView *) textView {
    if(self.firstTimeEditing == TRUE) {
        [self.inputFactTextField setText:@""];
        self.firstTimeEditing = FALSE;
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    
    NSInteger restrictedLength=70;
    
    NSString *temp=textView.text;
    
    if([[textView text] length] > restrictedLength){
        textView.text=[temp substringToIndex:[temp length]-1];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [self.inputFactTextField resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    else {
        // For any other character return TRUE so that the text gets added to the view
        return YES;
    }
}

@end
