//
//  SCRDrawView.h
//  Scribbles
//
//  Created by JOSH HENDERSHOT on 8/4/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCRDrawView : UIView

//@property (nonatomic) NSMutableArray * scribblePoints;
@property (nonatomic) NSMutableArray * scribbles;
@property(nonatomic) NSMutableDictionary * currentScribble;
@property (nonatomic) UIColor * lineColor;
@property (nonatomic) int lineWidth;
@property (nonatomic) UIButton * lineButton;
@property (nonatomic) BOOL scribbleMode;
@end



