//
//  RCUIRingCentralThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/12/14.
//
//

#import "RCUIRingCentralThemeStyle.h"
#import "RCUIThemeStyleHeader.h"

@implementation RCUIRingCentralThemeStyle

- (NSDictionary *) generateColorTable;
{
    return @{
             /* Primary Color */
             @"1"    : RGBACOLOR (6, 132, 189, 1),
             @"1a"   : RGBACOLOR (6, 132, 189, 0.4),
             @"1b"   : RGBACOLOR (213, 243, 253, 1),
             /* Common Color */
             @"2"    : RGBACOLOR (255, 136, 0, 1),
             // 3
             @"3"    : RGBACOLOR (230, 65, 60, 1),
             @"3a"   : RGBACOLOR (230, 65, 60, 0.4),
             @"3b"   : RGBACOLOR (254, 226, 226, 1),
             // 4
             @"4"    : RGBACOLOR (76, 217, 100, 1),
             @"4a"   : RGBACOLOR (76, 217, 100, 0.4),
             // 5
             @"5"    : RGBACOLOR (255, 234, 155, 1),
             // 6
             @"6"    : RGBACOLOR (255, 255, 255, 1),
             @"6a"   : RGBACOLOR (255, 255, 255, 0.4),
             // 7
             @"7"    : RGBACOLOR (47, 47, 47, 1),
             @"7a"   : RGBACOLOR (47, 47, 47, 0.4),
             @"7b"   : RGBACOLOR (179, 179, 179, 1),
             @"7c"   : RGBACOLOR (179, 179, 179, 0.4),
             @"7d"   : RGBACOLOR (226, 226, 226, 1),
             @"7e"   : RGBACOLOR (245, 245, 245, 1),
             /* Menu Color */
             @"8"    : RGBACOLOR (49, 55, 64, 1),
             /* Clear Color */
             @"10"    : [UIColor clearColor],
             };
}
@end
