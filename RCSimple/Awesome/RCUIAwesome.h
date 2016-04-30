//
//  RCUIAwesome.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 10/8/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RCUIAwesome : NSObject

@property (nonatomic, assign) UIOffset drawingPositionAdjustment;
@property (nonatomic, retain) UIColor* drawingBackgroundColor;
@property (nonatomic, assign) CGFloat  fontSize;

+ (void) AwesomeFontWithURL: (NSURL *)url;
+ (NSDictionary *) allAwesomeIcons;
+ (UIFont *) AwesomeFontWithSize: (CGFloat)size;
+ (id) AwesomeWithUnicode: (NSString *)code size: (CGFloat)size foregroundColor: (UIColor *)color;
- (void) setAttributes: (NSDictionary *)attrs;
- (void) addAttribute: (NSString *)name value: (id)value;
- (void) addAttributes: (NSDictionary *)attrs;
- (void) removeAttribute: (NSString *)name;
- (NSDictionary *) attributes;
- (id) attribute: (NSString *)attrName;
- (NSAttributedString *) attributedString;
- (NSString *) characterCode;
- (NSString *) AwesomeName;
- (UIFont *) AwesomeFont;
- (UIColor *) AwesomeColor;
- (UIImage *) AwesomeImageWithSize: (CGSize)sizeImage;
- (CGSize) sizeOfAttributedStringConstrained;
- (UIImage *) defaultConstrainedImage;

@end
