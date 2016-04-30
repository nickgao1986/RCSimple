//
//  RCUIAwesome.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 10/8/14.
//
//

#import "RCUIAwesome.h"
#import "RCUIGlobalCommon.h"
#import <CoreText/CoreText.h>

@interface RCUIAwesome ()
@property (nonatomic, retain) NSMutableAttributedString *mutableAttributedString;
@end

@implementation RCUIAwesome

+ (void) AwesomeFontWithURL: (NSURL *)url;
{
    NSAssert ([[NSFileManager defaultManager] fileExistsAtPath: [url path]], @"Awesome font file doesn't exist!");
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL ((__bridge CFURLRef)url);
    CGFontRef newFont = CGFontCreateWithDataProvider (fontDataProvider);
    CGDataProviderRelease (fontDataProvider);
    CFErrorRef error;
    CTFontManagerRegisterGraphicsFont (newFont, &error);
    CGFontRelease (newFont);
}

+ (NSDictionary *) allAwesomeIcons;
{
    return nil;
}

+ (UIFont *) AwesomeFontWithSize: (CGFloat)size;
{
    return nil;
}

+ (id) AwesomeWithUnicode: (NSString *)code size: (CGFloat)size foregroundColor: (UIColor *)color;
{
    RCUIAwesome *awesome = [[[self alloc] init] autorelease];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[NSFontAttributeName] = [self AwesomeFontWithSize: size];
    if (color)
    {
        dictionary[NSForegroundColorAttributeName] = color;
    }
    awesome.mutableAttributedString = [[[NSMutableAttributedString alloc] initWithString: code attributes: dictionary] autorelease];
    return awesome;
}

- (void) setAttributes: (NSDictionary *)attrs;
{
    if (!attrs)
    {
        NSMutableDictionary *mutableAttrs = [NSMutableDictionary dictionary];
        mutableAttrs[NSFontAttributeName] = [self AwesomeFont];
        mutableAttrs[NSForegroundColorAttributeName] = [self AwesomeColor];
        [mutableAttrs release];
    }
    [self.mutableAttributedString setAttributes: attrs range: [self rangeForMutableAttributedText]];
}

- (void) addAttribute: (NSString *)name value: (id)value;
{
    [self.mutableAttributedString addAttribute: name value: value range: [self rangeForMutableAttributedText]];
}

- (void) addAttributes: (NSDictionary *)attrs;
{
    [self.mutableAttributedString addAttributes: attrs range: [self rangeForMutableAttributedText]];
}

- (void) removeAttribute: (NSString *)name;
{
    [self.mutableAttributedString removeAttribute: name range: [self rangeForMutableAttributedText]];
}

- (NSRange) rangeForMutableAttributedText;
{
    return NSMakeRange (0, [self.mutableAttributedString length]);
}

- (NSDictionary *) attributes;
{
    return [self.mutableAttributedString attributesAtIndex: 0 effectiveRange: NULL];
}

- (id) attribute: (NSString *)attrName;
{
    return [self.mutableAttributedString attribute: attrName atIndex: 0 effectiveRange: NULL];
}

- (NSAttributedString *) attributedString;
{
    return [[self.mutableAttributedString copy] autorelease];
}

- (NSString *) characterCode;
{
    return [self.mutableAttributedString string];
}

- (NSString *) AwesomeName;
{
    return [[self class] allAwesomeIcons][[self characterCode]];
}

- (UIFont *) AwesomeFont;
{
    return (UIFont *)[self attribute: NSFontAttributeName];
}

- (UIColor *) AwesomeColor;
{
    return (UIColor *)[self attribute: NSForegroundColorAttributeName];
}

- (UIImage *) AwesomeImageWithSize: (CGSize)sizeImage;
{
    UIGraphicsBeginImageContextWithOptions (sizeImage, NO, [[UIScreen mainScreen] scale]);
    
	CGContextRef context = UIGraphicsGetCurrentContext ();
    [self fillBackgroundForContext: context backgroundSize: sizeImage];
    [self.mutableAttributedString drawInRect: [self drawingRectWithImageSize: sizeImage]];
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
	UIGraphicsEndImageContext ();
	
	return theImage;
}

- (void) fillBackgroundForContext: (CGContextRef)context backgroundSize: (CGSize)size;
{
    if (self.drawingBackgroundColor)
    {
		[self.drawingBackgroundColor setFill];
        CGContextFillRect (context, CGRectMake (0, 0, size.width, size.height));
	}
}

- (CGRect) drawingRectWithImageSize: (CGSize)sizeImage;
{
    CGSize sizeIcon = [self.mutableAttributedString size];
    CGFloat xOffset = ceil ((sizeImage.width - sizeIcon.width) / 2.);
    xOffset += self.drawingPositionAdjustment.horizontal;
    CGFloat yOffset = ceil ((sizeImage.height - sizeIcon.height) / 2.);
    yOffset += self.drawingPositionAdjustment.vertical;
    return CGRectMake (xOffset, yOffset, sizeIcon.width, sizeIcon.height);
}

- (CGSize) sizeOfAttributedStringConstrained;
{
    if (nil == self.mutableAttributedString)
    {
        return CGSizeZero;
    }
    
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)self.mutableAttributedString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString (attributedStringRef);
    
    if (NULL == framesetter)
    {
        return CGSizeZero;
    }
    
    CGSize newSize = CTFramesetterSuggestFrameSizeWithConstraints (framesetter, CFRangeMake (0, 0), NULL, CGSizeMake (CGFLOAT_MAX, CGFLOAT_MAX), NULL);
    CFRelease (framesetter);
    
    return CGSizeMake (RCUICGFloatCeil (newSize.width) + 2, RCUICGFloatCeil (newSize.height) + 2);
}

- (UIImage *) defaultConstrainedImage;
{
    return [self AwesomeImageWithSize: [self sizeOfAttributedStringConstrained]];
}

- (void) dealloc;
{
    self.mutableAttributedString = nil;
    self.drawingBackgroundColor  = nil; 
    [super dealloc];
}

@end
