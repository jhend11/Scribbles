//
//  SCRDrawView.m
//  Scribbles
//
//  Created by JOSH HENDERSHOT on 8/4/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import "SCRDrawView.h"

@implementation SCRDrawView
{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.lineColor = [UIColor darkGrayColor];
        self.lineWidth = 1;
        
        self.scribbles = [@[] mutableCopy];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    // this grabs our context layer to draw on
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    

    
    // this sets stroke or fill colors that follow
//    [self.lineColor set];
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    for (NSDictionary * scribble in self.scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"]intValue]);
        
        NSArray * points =  scribble[@"points"];
        
        UIColor * lineColor = scribble[@"color"];
        [lineColor set];
        
        if (points.count > 0)
        {
            CGPoint startPoint = [points[0] CGPointValue];
            
            CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        }
        
        
        
        //this draws the context
        
        for (NSValue * pointVal in points)
        {
            CGPoint  point = [pointVal CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
        CGContextStrokePath(context);

    }
    
    
    

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    self.currentScribble = [@{
                              @"color":self.lineColor,
                              @"points":[@[]mutableCopy],
                              @"width":@(self.lineWidth)
                              }mutableCopy];
    
    [self.scribbles addObject:self.currentScribble];
    
    [self scribbleWithTouches:touches];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self scribbleWithTouches:touches];

}

-(void)scribbleWithTouches:(NSSet*)touches
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [self.currentScribble[@"points"] addObject:[NSValue valueWithCGPoint: location]];
        
    }
    
    [self setNeedsDisplay];
}

@end
