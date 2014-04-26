//
//  ViewController.m
//  TLCircleProgressViewExample
//
//  Created by Tommy on 4/23/14.
//  Copyright (c) 2014 Lê Võ Minh Tâm. All rights reserved.
//

#import "ViewController.h"

#import "TLCircleProgressView.h"

#define TIME_INTERVAL 0.025
#define FPS 60.0

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TLCircleProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressViewDefault;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL
                                     target:self
                                   selector:@selector(increaseProgress)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)increaseProgress
{
    //CGFloat nextProgress = self.progressView.progress + 0.002;
    
    CGFloat nextProgress = (self.progressView.progress + (2.0f/FPS)*TIME_INTERVAL);
    
    if (nextProgress > 1) {
        nextProgress = 0;
    }
    
    [self.progressView setProgress:nextProgress animated:NO];
    [self.progressViewDefault setProgress:nextProgress animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
