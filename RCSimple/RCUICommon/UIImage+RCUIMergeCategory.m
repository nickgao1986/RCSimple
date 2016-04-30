//
//  UIImage+RCUIMergeCategory.m
//  RCUIKit
//
//  Created by Roman Gayu on 04/08/15.
//
//

#import "UIImage+RCUIMergeCategory.h"

@implementation UIImage (RCUIMergeCategory)

+ (instancetype) imageCombining: (UIImage *)img1 at: (CGRect)rect1 and: (UIImage *)img2 at: (CGRect)rect2;
{
    CGSize size = CGRectUnion (rect1, rect2).size;
    
    UIGraphicsBeginImageContextWithOptions (size, NO, [UIScreen mainScreen].scale);
    
    [img1 drawInRect: rect1];
    [img2 drawInRect: rect2];

    UIImage *result = UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return result;
}

@end
