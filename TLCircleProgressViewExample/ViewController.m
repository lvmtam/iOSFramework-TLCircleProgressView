//
//  ViewController.m
//  TLCircleProgressViewExample
//
//  Created by Tommy on 4/23/14.
//  Copyright (c) 2014 Lê Võ Minh Tâm. All rights reserved.
//

#import "ViewController.h"

#import "TLCircleProgressView.h"

@interface ViewController ()

@end

@implementation ViewController {
    TLCircleProgressView *progressView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    progressView = [[TLCircleProgressView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    
    [NSTimer scheduledTimerWithTimeInterval:0.025
                                     target:self
                                   selector:@selector(increaseProgress)
                                   userInfo:nil
                                    repeats:YES];
    
    [self.view addSubview:progressView];
}

- (void)increaseProgress
{
    CGFloat nextProgress = progressView.progress + 0.002;
    
    if (nextProgress > 1) {
        nextProgress = 0;
    }
    
    [progressView setProgress:nextProgress animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
