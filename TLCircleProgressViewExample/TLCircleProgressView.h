//
//  TLCircleProgressView.h
//  TLCircleProgressViewExample
//
//  Created by Tommy on 4/23/14.
//  Copyright (c) 2014 Lê Võ Minh Tâm. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TLCircleProgressView : UIView

@property (nonatomic) CGFloat progress;               // Default: 0
@property (nonatomic, strong) UIColor *progressColor; // Default: [UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:0.25]
@property (nonatomic, strong) UIColor *trackColor;    // Default: [UIColor whiteColor]



/**
 * This method use to set current progress of view
 * @param progress The progress value. The value from 0.0 to 1.0
 * @param animated If it's YES, the progress will be changed with animation. Otherwise, won't.
 */
- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
