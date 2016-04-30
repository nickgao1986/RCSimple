//
//  UIImage+RCUIProfileImagePlaceholderCategory.h
//  RCUIKit
//
//  Created by Roman Gayu on 05/08/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (RCUIProfileImagePlaceholderCategory)

+ (UIImage *) imagePlaceholderForProfileForFullName: (NSString *)fullName size: (CGSize)size font: (UIFont *)font bgColor: (UIColor *)bgColor color: (UIColor *)color;

@end
