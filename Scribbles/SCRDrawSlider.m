//
//  SCRDrawSlider.m
//  Scribbles
//
//  Created by JOSH HENDERSHOT on 8/4/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "SCRDrawSlider.h"

@implementation SCRDrawSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.maxWidth = 20;
        self.minWidth = 1;
        self.currentWidth = 1;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.lineColor set];
    
    float minY = 0;
    float maxY = rect.size.height;
    
    CGContextMoveToPoint(context, rect.size.width/2, minY); // start point of line
    CGContextAddLineToPoint(context, rect.size.width/2, maxY); // end point of line
    
    CGContextStrokePath(context); // actually paints the line between start and end of line
    
    
    float currentY = maxY - (self.currentWidth / self.maxWidth) * maxY;
    
    CGContextFillEllipseInRect(context, CGRectMake((rect.size.width - 10)/ 2, currentY, 10, 10));
    
    CGContextSetBlendMode(context, kCGBlendModeClear);
    
    CGContextFillEllipseInRect(context, CGRectMake((rect.size.width - 8)/2, currentY +1, 8, 8));
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeWidthWithTouches:touches];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeWidthWithTouches:touches];
}
-(void)changeWidthWithTouches:(NSSet*)touches
{
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self];
    
    self.currentWidth = self.maxWidth - (location.y / self.frame.size.height * self.maxWidth);
    
    if (self.currentWidth < self.minWidth) self.currentWidth = self.minWidth;
    if (self.currentWidth > self.maxWidth) self.currentWidth = self.maxWidth;
    
    [self.delegate updateLineWidth:self.currentWidth];
    [self setNeedsDisplay];
    
}

@end
