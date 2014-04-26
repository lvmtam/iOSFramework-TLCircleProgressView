//
//  TLCircleProgressView.m
//  TLCircleProgressViewExample
//
//  Created by Tommy on 4/23/14.
//  Copyright (c) 2014 Lê Võ Minh Tâm. All rights reserved.
//

#import "TLCircleProgressView.h"

#define TL_BACKGROUND_WIDTH 20
#define TL_LINE_WIDTH 20
#define TL_SLIDER_SIZE 150
#define TL_BLUR_VALUE 0

/** Helper Functions **/
//Degrees to Radian
#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )
//Radians to Degrees
#define radiansToDegrees( radians ) ( ( radians ) * ( 180.0 / M_PI ) )

/** Parameters **/
#define TB_SAFEAREA_PADDING 20



@interface TLCircleProgressView()
@property (nonatomic) CGFloat radius;
@property (nonatomic) CGFloat angle;
@property (nonatomic, strong) UILabel *lblProgress;
@end



@implementation TLCircleProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.radius = self.frame.size.width/2 - TB_SAFEAREA_PADDING;
        self.angle = 0;
        
        self.progressColor = [UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:0.25];
        self.trackColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.backgroundColor = [UIColor clearColor];
        
        // UIKit
        self.lblProgress = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     CGRectGetWidth(frame),
                                                                     CGRectGetHeight(frame))];
        self.lblProgress.textColor = self.trackColor;
        self.lblProgress.textAlignment = NSTextAlignmentCenter;
        self.lblProgress.font = [UIFont systemFontOfSize:30.0];
        self.lblProgress.center = CGPointMake(CGRectGetWidth(frame)/2,CGRectGetHeight(frame)/2);
        
        [self addSubview:self.lblProgress];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    //Get current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    /** DRAW CIRCLE BACKGROUND */
    
    //Create the path
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.radius, 0, M_PI *2, 0);

    //Set the stroke color to black
    [self.progressColor setStroke];
    
    //Define line width and cap
    CGContextSetLineWidth(context, TL_BACKGROUND_WIDTH);
    CGContextSetLineCap(context, kCGLineCapButt);
    
    //draw it!
    CGContextDrawPath(context, kCGPathStroke);
    
    
    /** DRAW CIRCLE TRACKING */
    
    //Create the path
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, self.radius, 0, degreesToRadians(self.angle), 0);
    
    //Set the stroke color to black
    [self.trackColor setStroke];
    
    //Define line width and cap
    CGContextSetLineWidth(context, TL_LINE_WIDTH);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //draw it!
    CGContextDrawPath(context, kCGPathStroke);
    
    
    /** Add some light reflection effects on the background circle**/
    
    CGContextSetLineWidth(context, 1);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //Draw the outside light
    CGContextBeginPath(context);
    CGContextAddArc(context, self.frame.size.width/2  , self.frame.size.height/2, self.radius+TL_BACKGROUND_WIDTH/2, 0, degreesToRadians(-self.angle), 1);
    [[UIColor colorWithWhite:1.0 alpha:0.05]set];
    CGContextDrawPath(context, kCGPathStroke);
    
    //draw the inner light
    CGContextBeginPath(context);
    CGContextAddArc(context, self.frame.size.width/2  , self.frame.size.height/2, self.radius-TL_BACKGROUND_WIDTH/2, 0, degreesToRadians(-self.angle), 1);
    [[UIColor colorWithWhite:1.0 alpha:0.05]set];
    CGContextDrawPath(context, kCGPathStroke);
    
}


- (void)setProgress:(float)progress animated:(BOOL)animated
{
    //Setup progress with animation
    self.progress = progress;
    self.angle = progress * 360;
    
    //Set text for the progress label
    self.lblProgress.text = [NSString stringWithFormat:@"%0.0f%@", progress * 100, @"%"];
    
    //Re-draw
    [self setNeedsDisplay];
}


@end
