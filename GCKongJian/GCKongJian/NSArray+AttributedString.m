//
//  NSArray+AttributedString.m
//  猎律客户版
//
//  Created by 高崇 on 2017/7/6.
//  Copyright © 2017年 北京猎律科技有限公司. All rights reserved.
//

#import "NSArray+AttributedString.h"

@implementation NSArray (AttributedString)

- (NSMutableAttributedString *)attributedString
{
    NSMutableAttributedString *attributedStringContainer = [[NSMutableAttributedString alloc] init];
    
    for (NSDictionary *dic in self)
    {
        NSString *title = dic[@"title"];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:title];
        [attributedString addAttributes:@{NSForegroundColorAttributeName: dic[@"color"], NSFontAttributeName: dic[@"font"]} range:NSMakeRange(0, title.length)];
        [attributedStringContainer appendAttributedString:attributedString];
    }
    
    return attributedStringContainer;
}

@end
