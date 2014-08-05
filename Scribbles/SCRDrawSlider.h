//
//  SCRDrawSlider.h
//  Scribbles
//
//  Created by JOSH HENDERSHOT on 8/4/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCRDrawSliderDelegate;

@interface SCRDrawSlider : UIView
@property (nonatomic) float maxWidth;
@property (nonatomic) float minWidth;
@property (nonatomic) float currentWidth;
// potentially will use to change the slider color based color selection
@property (nonatomic) UIColor * lineColor;
@property (nonatomic, assign) id <SCRDrawSliderDelegate> delegate;

@end

@protocol SCRDrawSliderDelegate <NSObject>

-(void)updateLineWidth:(float)lineWidth;


@end