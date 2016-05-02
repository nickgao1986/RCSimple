//
//  RCSPCalendarComponentFactory.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/15/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPCalendarComponentFactory.h"
#import "RCUIThemeStyleHeader.h"
#import "RCUIAppAwesomeIcons.h"

#define DOT_WIDTH           1
#define LINE_GAP            6

@implementation RCSPCalendarComponentFactory

#pragma mark - Label
+ (UILabel *) labelForCalendarDateTitle: (CGRect)frame;
{
    UILabel *label = [[[UILabel alloc] initWithFrame: frame] autorelease];
    label.font = RCUIRegularSystemFont(15);
    [label setAutoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [RCSPCalendarComponentFactory titleBlueColor];
    return label;
}

+ (UILabel *) labelForEventCellStartTime: (CGRect)frame;
{
    UILabel *label = [[[UILabel alloc] initWithFrame: frame] autorelease];
    label.font = RCUIRegularSystemFont(8);
    [label setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [RCSPCalendarComponentFactory darkGrayColor];
    return label;
}

+ (UILabel *) labelForEventCellGlanceTitle: (CGRect)frame;
{
    UILabel *label = [[[UILabel alloc] initWithFrame: frame] autorelease];
    label.font = RCUIRegularSystemFont(15);
    [label setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [RCSPCalendarComponentFactory darkGrayColor];
//    label.backgroundColor = [UIColor colorWithRed: 0 green:1 blue:0 alpha:0.5];
    return label;
}

+ (UILabel *) labelForEventCellGlanceDetail: (CGRect)frame;
{
    UILabel *label = [[[UILabel alloc] initWithFrame: frame] autorelease];
    label.font = RCUIRegularSystemFont(10);
    [label setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [RCSPCalendarComponentFactory darkGrayColor];
//    label.backgroundColor = [UIColor colorWithRed: 0 green:1 blue:0 alpha:0.5];
//    label.layer.borderColor = [[UIColor redColor] CGColor];
//    label.layer.borderWidth = 1;
    return label;
}

+ (UILabel *) labelForEventFreeTime: (CGRect)frame;
{
    UILabel *label = [[[UILabel alloc] initWithFrame: frame] autorelease];
    label.font = RCUILightSystemFont(10);
    [label setAutoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [RCSPCalendarComponentFactory lightGrayColor];
//    label.backgroundColor = [UIColor colorWithRed: 0 green:1 blue:0 alpha:0.5];
//    label.layer.borderColor = [[UIColor redColor] CGColor];
//    label.layer.borderWidth = 1;
    return label;
}

#pragma mark - Button
+ (UIButton *) buttonForEventCellGlanceAction: (CGRect)frame;
{
    UIButton *button = [[[UIButton alloc] initWithFrame: frame] autorelease];
    button.font = RCUIRegularSystemFont(10);
    [button setAutoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    UIColor *buttonColor = [UIColor whiteColor];
    [button setTitleColor: buttonColor forState: UIControlStateNormal];
    [button setTitleColor: buttonColor forState: UIControlStateHighlighted];
    return button;
}

#pragma mark - Image
+ (UIImage *) imageForEventCellLocation;
{
    return [RCUIAppAwesomeIcons calendarLocationIconWithSize: 20 color: [RCSPCalendarComponentFactory lightGrayColor]];
}

+ (UIImage *) imageForEventCellCall;
{
    return [RCUIAppAwesomeIcons calendarCallIconWithSize: 20 color: [RCSPCalendarComponentFactory lightGrayColor]];
}

+ (UIImage *) imageForEventCellVideo;
{
    return [RCUIAppAwesomeIcons meetingIconWithSize: 20 color: [RCSPCalendarComponentFactory lightGrayColor]];
}

#pragma mark - Color
+ (UIColor *) lightGrayColor;
{
    return [UIColor colorWithRed: 179.f/255.f green: 179.f/255.f blue: 179.f/255.f alpha: 1.0];
}

+ (UIColor *) darkGrayColor;
{
    return [UIColor colorWithRed: 47.f/255.f green: 47.f/255.f blue: 47.f/255.f alpha: 1.0];
}

+ (UIColor *) titleBlueColor;
{
    return [UIColor colorWithRed: 6.f/255.f green: 132.f/255.f blue: 189.f/255.f alpha: 1.0];
}

+ (UIColor *) borderGrayColor;
{
    return [UIColor colorWithRed: 226.f/255.f green: 230.f/255.f blue: 233.f/255.f alpha: 1.0];
}

+ (UIColor *) highlightedBackgroundColor;
{
    return [UIColor colorWithRed: 245.f/255.f green: 245.f/255.f blue: 245.f/255.f alpha: 1.0];
}

+ (UIColor *) defaultTableSeperatorColor;
{
    UITableView *tableView = [[[UITableView alloc] init] autorelease];
    UIColor *fillColor = [tableView separatorColor];
    return fillColor;
}

#pragma mark - DefaultValue
+ (CGFloat) defaultLineWidth;
{
    CGFloat scale = [RCSPCalendarComponentFactory screenScale];
    return 1.0f / scale;
}

+ (CGFloat) defaultPaddingWidth;
{
    return 16.f;
}

+ (CGFloat) screenScale;
{
    CGFloat scale = RCUIScreenScale();
    if (scale > 2)
    {
        scale = 2;
    }
    return scale;
}

#pragma mark - Lines
+ (UIView *) horizontalLine: (CGFloat)width;
{
    UIView *line = [RCSPCalendarComponentFactory lineWithFrame: CGRectMake(0, 0, width, [RCSPCalendarComponentFactory defaultLineWidth])];
    return line;
}

+ (UIView *) verticalLine: (CGFloat)height;
{
    UIView *line = [RCSPCalendarComponentFactory lineWithFrame: CGRectMake(0, 0, [RCSPCalendarComponentFactory defaultLineWidth], height)];
    return line;
}

+ (UIView *) lineWithFrame: (CGRect)frame;
{
    UIView *line = [[[UIView alloc] initWithFrame: frame] autorelease];
    line.backgroundColor = [RCSPCalendarComponentFactory defaultTableSeperatorColor];
    return line;
}

+ (void) drawDottedLineFromStartingPoint: (CGPoint)startPoint
                              toEndPoint: (CGPoint)endPoint
                                   color: (UIColor *)color;
{
    UIBezierPath *path = [[[UIBezierPath alloc] init] autorelease];
    
    [path moveToPoint: startPoint];
    [path addLineToPoint: endPoint];
    path.lineWidth = DOT_WIDTH;
    
    CGFloat dashes[] = {path.lineWidth * 0, path.lineWidth * 4};
    
    [path setLineDash: dashes count: 2 phase: 0];
    path.lineCapStyle = kCGLineCapRound;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [color CGColor]);
    
    [path stroke];
}

+ (void) drawLineFromStartingPoint: (CGPoint)startPoint
                        toEndPoint: (CGPoint)endPoint
                             color: (UIColor *)color;
{
    UIBezierPath *path = [[[UIBezierPath alloc] init] autorelease];
    
    [path moveToPoint: startPoint];
    [path addLineToPoint: endPoint];
    path.lineWidth = DOT_WIDTH;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [color CGColor]);
    
    [path stroke];
}

+ (void) drawGradientLineInRect: (CGRect)rect color: (UIColor *)color;
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat startX = rect.origin.x;
    CGFloat startY = rect.origin.y;
    CGFloat gap = LINE_GAP;
    CGFloat position = gap;
    while (position < width + height)
    {
        CGPoint startPoint = CGPointMake(startX + position, startY);
        CGPoint endPoint;
        if (position <= height)
        {
            endPoint = CGPointMake(startX, position + startY);
        }
        else
        {
            endPoint = CGPointMake(startX + position - height, height + startY);
        }
        [RCSPCalendarComponentFactory drawLineFromStartingPoint: startPoint toEndPoint: endPoint color: color];
        position = position + gap + DOT_WIDTH;
    }
}

@end
