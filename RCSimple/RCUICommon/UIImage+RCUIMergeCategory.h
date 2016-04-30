//
//  UIImage+RCUIMergeCategory.h
//  RCUIKit
//
//  Created by Roman Gayu on 04/08/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (RCUIMergeCategory)

+ (instancetype) imageCombining: (UIImage *)img1 at: (CGRect)rect1 and: (UIImage *)img2 at: (CGRect)rect2;

@end
