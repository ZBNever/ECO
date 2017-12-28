//
//  UIColor+Util.m
//  iosapp
//
//  Created by chenhaoxiang on 14-10-18.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import "UIColor+Util.h"
#import "AppDelegate.h"

@implementation UIColor (Util)

#pragma mark - Hex

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark - theme colors

+ (UIColor *)themeColor
{
    return [UIColor greenColor];
}

+ (UIColor *)nameColor
{
    return [UIColor colorWithHex:0x087221];
}

+ (UIColor *)titleColor
{
    return [UIColor blackColor];
}

+ (UIColor *)separatorColor
{
    return [UIColor colorWithRed:217.0/255 green:217.0/255 blue:223.0/255 alpha:1.0];
}

+ (UIColor *)cellsColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)titleBarColor
{
    return [UIColor colorWithHex:0xE1E1E1];
}

+ (UIColor *)contentTextColor
{
    return [UIColor colorWithHex:0x272727];
}


+ (UIColor *)selectTitleBarColor
{
    return [UIColor colorWithHex:0xE1E1E1];
}

+ (UIColor *)navigationbarColor
{
    return [UIColor colorWithHex:0x15A230];//0x009000
}

+ (UIColor *)selectCellSColor
{
    return [UIColor colorWithRed:203.0/255 green:203.0/255 blue:203.0/255 alpha:1.0];
}

+ (UIColor *)labelTextColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)teamButtonColor
{
    return [UIColor colorWithRed:251.0/255 green:251.0/255 blue:253.0/255 alpha:1.0];
}

+ (UIColor *)infosBackViewColor
{
    return [UIColor clearColor];
}

+ (UIColor *)lineColor
{
    return [UIColor colorWithHex:0x2bc157];
}


+ (UIColor *)colorForCCC
{
    return [UIColor colorWithHexString:@"cccccc"];
}

+ (UIColor *)colorForFFF
{
    return [UIColor colorWithHexString:@"ffffff"];
}
+ (UIColor *)colorFor333
{
    return [UIColor colorWithHexString:@"333333"];
}
+ (UIColor *)colorFor999
{
    return [UIColor colorWithHexString:@"999999"];
}
+ (UIColor *)colorForF3
{
    return [UIColor colorWithHexString:@"f3f3f3"];
}

@end
