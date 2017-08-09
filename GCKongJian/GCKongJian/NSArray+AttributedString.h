//
//  NSArray+AttributedString.h
//  猎律客户版
//
//  Created by 高崇 on 2017/7/6.
//  Copyright © 2017年 北京猎律科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (AttributedString)

/** 
 使用方法 eg:
 NSDictionary *dic = @{  
                         @"title" : @"订单状态: ",
                         @"font" : [UIFont systemFontOfSize:16],
                         @"color" : [UIColor blackColor]
                         };
 NSDictionary *dic1 = @{
                         @"title" : @"",
                         @"font" : [UIFont systemFontOfSize:16],
                         @"color" : [UIColor blackColor]
                         };
 
 self.stateLabel.attributedText = [@[dic, dic1] attributedString];
 
 */
- (NSMutableAttributedString *)attributedString;

@end
