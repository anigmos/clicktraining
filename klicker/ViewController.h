//
//  ViewController.h
//  klicker
//
//  Created by Simon on 26.10.14.
//  Copyright (c) 2014 Simon Steinhge. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController{
    IBOutlet NSTextField *userTextField;
    IBOutlet NSButton *startButton;
    IBOutlet NSButton *stopButton;
}
@property (nonatomic,retain) IBOutlet NSTextField *userTextField;
@property (nonatomic,retain) IBOutlet NSButton *startButton;
@property (nonatomic,retain) IBOutlet NSButton *stopButton;

- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
@end

