//
//  LabelCell.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/4.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "LabelCell.h"

@interface LabelCell ()
@property (nonatomic, strong) UILabel *oneLabel;

@end

@implementation LabelCell 

#pragma mark - lazy

- (UILabel *)oneLabel
{
    return GC_LAZY(_oneLabel, ({
        UILabel *view = [[UILabel alloc] init];
        view.text = @"";
        view.textColor = [UIColor colorWithHexString:@""];
        view.font = [UIFont systemFontOfSize:12];
        view.numberOfLines = 0;
        view.textAlignment = NSTextAlignmentCenter;
        view.preferredMaxLayoutWidth = 100;
        [self.contentView addSubview:view];
        view;
        
    }));
}


@end
