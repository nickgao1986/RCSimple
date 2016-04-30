//
//  RCUIAppAwesomeIcons.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 10/8/14.
//
//

#import "RCUIAppAwesomeIcons.h"
#import "UIImage+RCUIStretchable.h"
#import "UIImage+RCUICategory.h"
#import "UIImage+RCUIMergeCategory.h"

@implementation RCUIAppAwesomeIcons

+ (UIFont *) AwesomeFontWithSize: (CGFloat)size;
{
#ifndef DISABLE_FONTAWESOME_AUTO_REGISTRATION
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        [self AwesomeFontWithURL: [[NSBundle mainBundle] URLForResource: @"RCFont" withExtension: @"ttf"]];
    });
#endif
    
    UIFont *font = [UIFont fontWithName: @"RCFont" size: size];
    NSAssert (font, @"UIFont object should not be nil, check if the font file is added to the application bundle and you're using the correct font name.");
    return font;
}

+ (UIImage *) hollowDXFIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"H" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowEPSIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"I" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMCWIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"J" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowWQ1IconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"K" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowWK4IconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"L" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowAWDIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"M" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowWK1IconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"N" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMHTMLIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"O" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVDXIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"P" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMHTIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"Q" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowBMPIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"R" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPPTMIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"S" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowJPEGIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"T" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDOCXIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"U" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHTMLIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"V" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDOCMIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"W" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPUBIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"X" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPSDIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"Y" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPPTIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"Z" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPNGIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"[" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPDFIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\\" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPCXIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"]" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowLOGIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"^" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowJPGIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"_" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHTMIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"`" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHPPIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"a" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"b" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowGIFIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"c" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowERRIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"d" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDOTIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"e" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDOCIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"f" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCSVIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"g" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCPPIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"h" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"i" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowTXTIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"j" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPPTXIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"k" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowRTFIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"l" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowTGAIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"m" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowTIFIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"n" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowTIFFIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"o" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVSDIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"p" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVSDXIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"q" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowWPDIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"r" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowWPSIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"s" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowWRIIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"t" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowXLSIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"u" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowXLSBIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"v" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowXLSMIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"w" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowXLSXIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"x" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowXMLIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"y" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowKeypadCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"!" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowParkCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\"" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowTransferCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"#" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowRecordCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"$" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowStationCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"%" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowAudioCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"&" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFlipCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"'" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHoldCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"(" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowUnHoldCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"7" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowSpeakerCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @")" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowBluetoothCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"*" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMuteCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"," size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowUnMuteCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"+" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCarrierCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"2" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) keypadCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"-" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) parkCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"." size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) transferCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"/" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) recordCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00EA" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) unRecordCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"0" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) stationCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"1" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) audioCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"3" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) flipCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"4" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) holdCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"5" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) unHoldCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"<" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) speakerCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) bluetoothCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"8" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) muteCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @":" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) unMuteCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"9" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) carrierCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @";" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDocumentIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2470" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPhotosIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2489" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCameraIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2484" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDropboxIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2465" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDownArrowIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2463" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowThinDownArrowIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2466" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowBoxIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2483" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowGoogleDriveIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2485" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMeetingIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"G" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowGlipIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2490" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowTextIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00A5" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFaxIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00A6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowConferenceIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00A3" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) meetingIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F8" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) textIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F7" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) faxIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F9" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) conferenceIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00FA" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowKeypadIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00A4" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMessageIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2487" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFavoritesIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2488" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCalllogIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E1" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowContactsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"}" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDocumentsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2470" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowReportsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"?" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) rolesPermissionsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"B" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVoIPIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B5" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowSettingsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2467" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) keypadIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F2" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) messageIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F1" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) favoritesIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E9" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) calllogIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F3" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) contactsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F5" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) documentsIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F4" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowConferenceCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);

    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowConferenceIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) hollowMeetingCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowMeetingIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) hollowGlipCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowGlipIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) hollowDocumentsCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowDocumentsIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) hollowTextCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowTextIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) hollowFavoritesCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowFavoritesIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) hollowFaxCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    [[RCUIAppAwesomeIcons hollowFaxIconWithSize: size color: color] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) conferenceCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowConferenceIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) meetingCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowMeetingIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) glipCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowGlipIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) documentsCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowDocumentsIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) textCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowTextIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) favoritesCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowFavoritesIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) faxCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    [[RCUIAppAwesomeIcons hollowFaxIconWithSize: size color: [UIColor whiteColor]] drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) qosUnusedIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00BC" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) qosPoorIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00BF" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) qosAverageIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00BE" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) qosPerfectIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00BD" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHDVoiceIndicatorWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F0" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVoIPUnavailableWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVoIPOnlyWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00F6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowSearchIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2473" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowBluetoothIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2472" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMuteIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"{" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowLockedMuteIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    UIImage *muteIcon = [self hollowMuteIconWithSize:size color:color];
    UIImage *secureIcon = [self secureIconWithSize:size * 1./2. color:color];

    return [UIImage
        imageCombining: muteIcon
        at: CGRectMake(0., 0., muteIcon.size.width, muteIcon.size.height)
        and: secureIcon
        at:  CGRectMake(
            muteIcon.size.width - secureIcon.size.width + size / 4.,
            muteIcon.size.height - secureIcon.size.height,
            secureIcon.size.width,
            secureIcon.size.height)];
}

+ (UIImage *) hollowUnMuteIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00DC" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowAudioIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00DD" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCopyIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00DE" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowSpeakerIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2496" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowVoicemailIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00A7" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPlayCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"|" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowStopCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"(" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDownloadCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"z" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowLoadingCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00EF" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowBillingIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00A9" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowBillingEuropeIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B0" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPhonesystemIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2482" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowLogoutIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00FC" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPenIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2469" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowNoInternetIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"F" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCallInIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E3" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCallOutIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E2" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCallFailedIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00C6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFaxInIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"=" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFaxOutIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E7" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowForwardArrowIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E8" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFaxFailedIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2481" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDeleteIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E4" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowEmptyIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00AF" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowEmptyBoldIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00AB" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHideKeypadIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"@" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPhoneIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00AE" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowAddContactIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00C7" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowEndCallIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"D" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFileIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00AA" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowGroupTextIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"A" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowGroupContactCircleRegularIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00ED" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowDownloadIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B4" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowReloadIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2460" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowExtensionSettingIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2479" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowQuestionCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2476" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowInformationCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2477" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowAlertCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2478" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowContactCircleThinIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00EC" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowContactCircleRegularIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00EE" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCloseCircleIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2471" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowSendIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B1" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowMarkIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00BA" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowForwardIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00AC" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowLightForwardIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E5" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowEditIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u02C2" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) contactSuccessHintIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\uE900" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) contactEditIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\uE901" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) contactImportIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\uE902" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) contactLockIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\uE903" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFilterIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2468" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowKeyboardQuitIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B8" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowPhoneBoldIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u02C4" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowFaxoutBoldIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00E6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) noInternetIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00FF" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) pinIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) dndIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"C" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) offlineIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"E" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) voipOnlyIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"E" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) secureIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00EB" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) toolBarIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u2490" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) closeIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00FB" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) markIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B9" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) moreBoldIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u02C5" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) plusBoldIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u02C6" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) downArrowIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u02C0" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowHomeIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00CC" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) lightMarkIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00BB" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowLightMarkIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\u00B2" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) calendarCallIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\uE904" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) calendarLocationIconWithSize: (CGFloat)size color: (UIColor *)color;
{
    return [[self AwesomeWithUnicode: @"\uE905" size: size foregroundColor: color] defaultConstrainedImage];
}

+ (UIImage *) hollowCalendarCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setStroke];
        [bezier stroke];
    }
    [[UIColor clearColor] setFill];
    [bezier fill];
    
    // add dynamic icon - normal
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay
                                                                   fromDate: [NSDate date]];
    NSInteger dayInt = components.day; //dayInt = 1;
    NSString *imgNName = [NSString stringWithFormat:@"JoinNow_%ld", (long)dayInt];
    UIImage *nImg = [UIImage imageNamed:imgNName];
    [nImg drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}


+ (UIImage *) calendarCircleWithRadius: (CGFloat)radius size: (CGFloat)size color: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, radius * 2, radius * 2);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
    [bezier closePath];
    [bezier addClip];
    
    if (color)
    {
        [color setFill];
        [bezier fill];
    }
    
    // add dynamic icon - pressed
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay
                                                                   fromDate: [NSDate date]];
    NSInteger dayInt = components.day; //dayInt = 1;
    NSString *imgPName = [NSString stringWithFormat:@"JoinNow_%ld_pressed", (long)dayInt];
    UIImage *pImg = [UIImage imageNamed:imgPName];
    [pImg drawInRect: rect contentMode: UIViewContentModeCenter];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (radius, radius, radius, radius)];
}

#pragma mark -

+ (NSDictionary *) allAwesomeIcons;
{
    return @{
             @"!" : @"hollow keypad circle",
             @"\"" : @"hollow park circle",
             @"#" : @"hollow transfer circle",
             @"$" : @"hollow record circle",
             @"%" : @"hollow station circle",
             @"&" : @"hollow audio circle",
             @"'" : @"hollow flip circle",
             @"(" : @"hollow hold circle",
             @")" : @"hollow speaker cirlce",
             @"*" : @"hollow bluetooth circle",
             
             @"+" : @"hollow unmute circle",
             @"," : @"hollow mute circle",
             @"-" : @"keypad circle",
             @"." : @"park circle",
             @"/" : @"transfer circle",
             @"0" : @"unrecord circle",
             @"1" : @"station circle",
             @"2" : @"hollow carrier circle",
             @"3" : @"audio circle",
             @"4" : @"flip circle",
             
             @"5" : @"hold circle",
             @"6" : @"speaker circle",
             @"7" : @"hollow unhold circle",
             @"8" : @"bluetooth circle",
             @"9" : @"unmute circle",
             @":" : @"mute circle",
             @";" : @"carrier circle",
             @"<" : @"unhold circle",
             @"=" : @"hollow fax in",
             //@"003E" : @"",
             
             @"?" : @"hollow reports",
             @"@" : @"hollow hide keypad",
             @"A" : @"hollow group text",
             //@"0042" : @"hollow group contact circle",
             @"C" : @"dnd",
             @"D" : @"hollow end call",
             @"E" : @"offline",
             @"F" : @"hollow no internet",
             @"G" : @"hollow meeting",
             @"H" : @"hollow dxf",
             
             @"I" : @"hollow eps",
             @"J" : @"hollow mcw",
             @"K" : @"hollow wq1",
             @"L" : @"hollow wk4",
             @"M" : @"hollow awd",
             @"N" : @"hollow wk1",
             @"O" : @"hollow mhtml",
             @"P" : @"hollow vdx",
             @"Q" : @"hollow mht",
             @"R" : @"hollow bmp",
             
             @"S" : @"hollow pptm",
             @"T" : @"hollow jpeg",
             @"U" : @"hollow docx",
             @"V" : @"hollow html",
             @"W" : @"hollow docm",
             @"X" : @"hollow pub",
             @"Y" : @"hollow psd",
             @"Z" : @"hollow ppt",
             @"[" : @"hollow png",
             @"\\" : @"hollow pdf",
             
             @"]" : @"hollow pcx",
             @"^" : @"hollow log",
             @"_" : @"hollow jpg",
             @"`" : @"hollow htm",
             @"a" : @"hollow hpp",
             @"b" : @"hollow h",
             @"c" : @"hollow gif",
             @"d" : @"hollow err",
             @"e" : @"hollow dot",
             @"f" : @"hollow doc",
             
             @"g" : @"hollow csv",
             @"h" : @"hollow cpp",
             @"i" : @"hollow c",
             @"j" : @"hollow txt",
             @"k" : @"hollow pptx",
             @"l" : @"hollow rtf",
             @"m" : @"hollow tga",
             @"n" : @"hollow tif",
             @"o" : @"hollow tiff",
             @"p" : @"hollow vsd",
             
             @"q" : @"hollow vsdx",
             @"r" : @"hollow wpd",
             @"s" : @"hollow wps",
             @"t" : @"hollow wri",
             @"u" : @"hollow xls",
             @"v" : @"hollow xlsb",
             @"w" : @"hollow xlsm",
             @"x" : @"hollow xlsx",
             @"y" : @"hollow xml",
             @"z" : @"hollow download circle",
             
             @"{" : @"hollow mute",
             @"|" : @"hollow play circle",
             @"}" : @"hollow contact circle",
             @"\u00A3" : @"hollow conference",
             @"\u00A4" : @"hollow keypad",
             @"\u00A5" : @"hollow text",
             @"\u00A6" : @"hollow fax",
             @"\u00A7" : @"hollow voicemail",
             //@"\u00A8" : @"",
             @"\u00A9" : @"hollow billing",
             
             @"\u00AA" : @"hollow file",
             @"\u00AB" : @"hollow empty bold",
             @"\u00AC" : @"hollow forward",
             @"\u00AE" : @"hollow phone",
             @"\u00AF" : @"hollow empty",
             @"\u00B0" : @"hollow billing europe",
             @"\u00B1" : @"hollow send",
             @"\u00B2" : @"light mark",
             //@"\u00B3" : @"",
             @"\u00B4" : @"hollow download",
             
             @"\u00B5" : @"hollow voip",
             @"\u00B6" : @"pin",
             @"\u00B8" : @"hollow keyboard quit",
             @"\u00B9" : @"hollow mark",
             @"\u00BA" : @"mark",
             @"\u00BB" : @"hollow light mark",
             @"\u00BC" : @"qos unused",
             @"\u00BD" : @"qos perfect",
             @"\u00BE" : @"qos average",
             @"\u00BF" : @"qos poor",
             
             @"\u00C6" : @"hollow call failed",
             @"\u00C7" : @"hollow add contact",
             @"\u00CC" : @"hollow home",
             @"\u00DC" : @"hollow unmute",
             @"\u00DD" : @"hollow audio",
             @"\u00DE" : @"hollow copy",
             //@"\u00DF" : @"",
             //@"\u00E0" : @"",
             @"\u00E1" : @"hollow calllog",
             @"\u00E2" : @"hollow call out",
             
             @"\u00E3" : @"hollow call in",
             @"\u00E4" : @"hollow delete",
             @"\u00E5" : @"hollow light forward",
             @"\u00E6" : @"hollow forward",
             @"\u00E7" : @"hollow fax out",
             @"\u00E8" : @"hollow forward arrow",
             @"\u00E9" : @"star",
             @"\u00EA" : @"record circle",
             @"\u00EB" : @"secure",
             @"\u00EC" : @"hollow contact circle thin",
             
             @"\u00ED" : @"hollow group contact circle regular",
             @"\u00EE" : @"hollow contact circle regular",
             @"\u00EF" : @"hollow loading circle",
             @"\u00F0" : @"hollow hd voice indicator",
             @"\u00F1" : @"message",
             @"\u00F2" : @"keypad",
             @"\u00F3" : @"calllog",
             @"\u00F4" : @"document",
             @"\u00F5" : @"contact circle",
             @"\u00F6" : @"hollow voip unavailable",
             
             @"\u00F7" : @"text",
             @"\u00F8" : @"meeting",
             @"\u00F9" : @"fax",
             @"\u00FA" : @"conference",
             @"\u00FB" : @"close",
             @"\u00FC" : @"hollow logout",
             //@"\u00FD" : @"",
             //@"\u00FE" : @"",
             @"\u00FF" : @"no internet",
             @"\u02C0" : @"down arrow",
             @"\uE900" : @"cloud success hint",
             @"\uE901" : @"cloud edit",
             @"\uE902" : @"cloud import",
             @"\u02C2" : @"hollow edit bold",
             @"\u02C4" : @"hollow phone bold",
             @"\u02C5" : @"more bold",
             @"\u02C6" : @"plus bold",
             @"\u2460" : @"hollow reload",
             
             //@"\u2462" : @"",
             @"\u2463" : @"hollow down arrow",
             @"\u2465" : @"hollow dropbox",
             //@"\u2466" : @"",
             @"\u2467" : @"hollow settings",
             @"\u2468" : @"hollow filter bold",
             @"\u2469" : @"hollow pen edit",
             @"\u2470" : @"hollow document",
             @"\u2471" : @"hollow close circle",
             @"\u2472" : @"hollow bluetooth",
             
             @"\u2473" : @"hollow search",
             //@"\u2474" : @"",
             //@"\u2475" : @"",
             @"\u2476" : @"hollow question circle",
             @"\u2477" : @"hollow infomation circle",
             @"\u2478" : @"hollow alert circle",
             @"\u2479" : @"hollow extension setting",
             //@"\u2480" : @"",
             @"\u2481" : @"hollow fax failed",
             @"\u2482" : @"hollow phone system",
             
             @"\u2483" : @"hollow box",
             @"\u2484" : @"hollow camera",
             @"\u2485" : @"hollow google drive",
             @"\u2487" : @"hollow message",
             @"\u2488" : @"hollow star",
             @"\u2489" : @"hollow picture",
             @"\u2490" : @"tool bar",
             @"\u2496" : @"hollow speaker",
             
             @"\uE904" : @"calendar call",
             @"\uE905" : @"calendar location",
            };
}

@end
