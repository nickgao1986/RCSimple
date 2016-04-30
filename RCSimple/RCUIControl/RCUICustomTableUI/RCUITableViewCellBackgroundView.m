//
//  RCUITableViewCellBackgroundView.m
//  RCUIKit
//
//  Created by Kingle Zhuang on 4/5/12.
//  Copyright 2012 RingCentral, Inc. All rights reserved.
//

#import "RCUITableViewCellBackgroundView.h"
//#import "RCUITableViewPositonConstMacros.h"
#import "RCUIGlobalStyle.h"

#define kDefaultBorderWidth     1.f

@implementation RCUITableViewCellBackgroundView

- (BOOL) isOpaque;
{
    return NO;
}

- (id) initWithFrame: (CGRect)frame;
{
	self = [super initWithFrame: frame];
	
    if (self)
	{
        self.backgroundColor = [UIColor clearColor];
    }
	
    return self;
}

- (UIBezierPath *) bezierPathWithBorderRect: (CGRect)rect borderWidth: (CGFloat)borderWidth;
{
    UIBezierPath *bezierPath = nil;
    
    if (self.position == RCUITableViewGroupCellPositionTop)
    {
        rect.origin.y += borderWidth;
        rect.size.height -= borderWidth;
//        bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake (RCUI_TABLEVIEW_CELL_RADIUS, RCUI_TABLEVIEW_CELL_RADIUS)];
    }
    else if (self.position == RCUITableViewGroupCellPositionMiddle)
    {
        rect.origin.y -= borderWidth;
        rect.size.height += borderWidth;
        bezierPath = [UIBezierPath bezierPathWithRect: rect];
    }
    else if (self.position == RCUITableViewGroupCellPositionBottom)
    {
        rect.origin.y -= borderWidth;
//        bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake (RCUI_TABLEVIEW_CELL_RADIUS, RCUI_TABLEVIEW_CELL_RADIUS)];
    }
    else if (self.position == RCUITableViewGroupCellPositionSingle)
    {
//        bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: RCUI_TABLEVIEW_CELL_RADIUS];
    }
    
    bezierPath.lineWidth = borderWidth;
    [bezierPath closePath];
    return bezierPath;
}

- (void) drawRect: (CGRect)rect;
{
    CGContextRef ctx = UIGraphicsGetCurrentContext ();
    
    CGContextSaveGState (ctx);
    
    UIBezierPath *bezierPath = [self bezierPathWithBorderRect: rect borderWidth: kDefaultBorderWidth];
    [bezierPath addClip];
    
    if (self.fillColor)
    {
        [self.fillColor setFill];
        [bezierPath fill];
    }
    
    if (self.borderColor)
    {
        [self.borderColor setStroke];
        [bezierPath stroke];
    }
    
    CGContextRestoreGState (ctx);
}

- (void) setPosition: (RCUITableViewGroupCellPosition)position;
{
	if (_position != position)
	{
		_position = position;
		[self setNeedsDisplay];
	}
}

- (void) setFrame: (CGRect)frame;
{
    [super setFrame: frame];
    [self setNeedsDisplay];
}

- (void) dealloc;
{
    self.borderColor = nil;
	self.fillColor   = nil;

    [super dealloc];
}

@end


