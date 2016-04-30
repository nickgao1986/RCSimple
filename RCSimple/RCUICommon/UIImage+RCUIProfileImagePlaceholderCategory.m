//
//  UIImage+RCUIProfileImagePlaceholderCategory.m
//  RCUIKit
//
//  Created by Roman Gayu on 05/08/15.
//
//

#import "UIImage+RCUIProfileImagePlaceholderCategory.h"

@implementation UIImage (RCUIProfileImagePlaceholderCategory)

+ (NSString *) splittedSymbols: (NSString*)fullName;
{
    NSMutableString * result = [NSMutableString string];
    for (NSString * word in [fullName componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]])
    {
        if (word.length)
        {
            NSString * firstLetter = [word substringWithRange: [word rangeOfComposedCharacterSequenceAtIndex: 0]];
            [result appendString: [firstLetter uppercaseString]];
            if (result.length == 2)
            {
                break;
            }
        }
    }
    return result;
}

+ (UIImage *) imagePlaceholderForProfileForFullName: (NSString *)fullName size: (CGSize)size font: (UIFont *)font bgColor: (UIColor *)bgColor color: (UIColor *)color;
{
    CGFloat fontSize = size.height / 2.2;

    if (nil == fullName)
    {
        fullName = @"John Appleseed";
    }
    
    if (nil == font)
    {
        font = [UIFont systemFontOfSize: fontSize];
    }

    if (nil == bgColor)
    {
        bgColor = [UIColor lightGrayColor];
    }

    if (nil == color)
    {
        color = [UIColor whiteColor];
    }

    UIGraphicsBeginImageContextWithOptions (size, NO, [UIScreen mainScreen].scale);

    CGContextRef context = UIGraphicsGetCurrentContext ();

    NSString* symbols = [self splittedSymbols: fullName];
    
    [bgColor setFill];
    
    [[UIBezierPath bezierPathWithOvalInRect: CGRectMake (0, 0, size.width, size.height)] fill];
    
    CGRect stringRect = CGRectMake (0, 0, size.width, size.height);
    NSMutableParagraphStyle * initialsStringStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    initialsStringStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary * fontAttrs = @{ NSFontAttributeName: font, NSForegroundColorAttributeName: color, NSParagraphStyleAttributeName: initialsStringStyle };
    
    CGFloat textHeight = [symbols boundingRectWithSize: CGSizeMake (stringRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: fontAttrs context: nil].size.height;

    CGContextSaveGState (context);
    CGContextClipToRect (context, stringRect);
    [symbols drawInRect: CGRectMake (CGRectGetMinX (stringRect), CGRectGetMinY (stringRect) + (CGRectGetHeight (stringRect) - textHeight) / 2, CGRectGetWidth (stringRect), textHeight) withAttributes: fontAttrs];
    CGContextRestoreGState (context);

    return UIGraphicsGetImageFromCurrentImageContext ();
}

@end
