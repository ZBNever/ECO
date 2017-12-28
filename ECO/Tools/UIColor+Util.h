//
//  UIColor+Util.h
//  iosapp
//
//  Created by chenhaoxiang on 14-10-18.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;
/** 十六进制颜色 */
+ (UIColor *) colorWithHexString: (NSString *)color;
/** #cccccc */
+ (UIColor *)colorForCCC;
/** #ffffff */
+ (UIColor *)colorForFFF;
/** 333333 */
+ (UIColor *)colorFor333;
/** #999999 */
+ (UIColor *)colorFor999;
/** #f3f3f3 */
+ (UIColor *)colorForF3;
+ (UIColor *)themeColor;
+ (UIColor *)nameColor;
+ (UIColor *)titleColor;
+ (UIColor *)separatorColor;
+ (UIColor *)cellsColor;
+ (UIColor *)titleBarColor;
+ (UIColor *)selectTitleBarColor;
+ (UIColor *)navigationbarColor;
+ (UIColor *)selectCellSColor;
+ (UIColor *)labelTextColor;
+ (UIColor *)teamButtonColor;
+ (UIColor *)infosBackViewColor;
+ (UIColor *)lineColor;

+ (UIColor *)contentTextColor;

@end
