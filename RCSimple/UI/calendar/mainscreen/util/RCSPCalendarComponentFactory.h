//
//  RCSPCalendarComponentFactory.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/15/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCSPCalendarComponentFactory : NSObject

#pragma mark - Label
+ (UILabel *) labelForCalendarDateTitle: (CGRect)frame;
+ (UILabel *) labelForEventCellStartTime: (CGRect)frame;
+ (UILabel *) labelForEventCellGlanceTitle: (CGRect)frame;
+ (UILabel *) labelForEventCellGlanceDetail: (CGRect)frame;
+ (UILabel *) labelForEventFreeTime: (CGRect)frame;

#pragma mark - Button
+ (UIButton *) buttonForEventCellGlanceAction: (CGRect)frame;

#pragma mark - Image
+ (UIImage *) imageForEventCellLocation;
+ (UIImage *) imageForEventCellCall;
+ (UIImage *) imageForEventCellVideo;

#pragma mark - Color
+ (UIColor *) lightGrayColor;
+ (UIColor *) darkGrayColor;
+ (UIColor *) borderGrayColor;
+ (UIColor *) highlightedBackgroundColor;

#pragma mark - Line
+ (UIView *) horizontalLine: (CGFloat)width;
+ (UIView *) verticalLine: (CGFloat)height;

+ (void) drawDottedLineFromStartingPoint: (CGPoint)startPoint
                              toEndPoint: (CGPoint)endPoint
                                   color: (UIColor *)color;

+ (void) drawLineFromStartingPoint: (CGPoint)startPoint
                        toEndPoint: (CGPoint)endPoint
                             color: (UIColor *)color;

+ (void) drawGradientLineInRect: (CGRect)rect
                          color: (UIColor *)color;
@end
