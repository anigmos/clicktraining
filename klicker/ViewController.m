//
//  ViewController.m
//  klicker
//
//  Created by Simon on 26.10.14.
//  Copyright (c) 2014 Simon Steinhge. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
int klicks;
int leftClick = 0;
int rightClick = 0;
bool tracker = true;
NSString* user;
NSString *username;

@synthesize userTextField;
@synthesize startButton;
@synthesize stopButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    klicks = 0;
    username = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    if(username.length < 1) username = @"anonymouse";
    userTextField.stringValue = username;
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseDownMask handler: ^(NSEvent *event) {
        leftClick++;
        [self submit:leftClick :1];
    }];
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSRightMouseDownMask handler: ^(NSEvent *event) {
        rightClick++;
        [self submit:rightClick :2];
        
    }];
}

- (void) submit:(int) klick :(int) art {
    if(tracker == true){
        username = [userTextField stringValue];
        NSString *query =@"http://i-am-with-you.com/?page=submit";
        query = [query stringByAppendingString:@"&button="];
        query = [query stringByAppendingString:[NSString stringWithFormat:@"%i", art]];
        query = [query stringByAppendingString:@"&user="];
        query = [query stringByAppendingString:username];
        NSURL *queryURL = [NSURL URLWithString:query];
        //NSLog(@"%@",query);
        NSData* data = [NSData dataWithContentsOfURL:queryURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    }
}

- (void)fetchedData:(NSData *)responseData {
}



- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


-(IBAction)start:(id)sender{
    tracker = true;
    username = [userTextField stringValue];
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
    stopButton.enabled = true;
    startButton.enabled = false;

}
-(IBAction)stop:(id)sender{
    tracker = false;
    stopButton.enabled = false;
    startButton.enabled = true;
}


@end
