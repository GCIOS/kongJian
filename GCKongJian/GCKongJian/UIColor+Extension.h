//
//  UIColor+Extension.h
//  dangMeiTouTiao
//
//  Created by 高崇 on 16/4/22.
//  Copyright © 2016年 LieLvWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithRed:(CGFloat)red Green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/** UIColor 转UIImage */
+ (UIImage*)imageWithColor: (UIColor*) color;


@end
