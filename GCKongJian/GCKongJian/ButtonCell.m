//
//  ButtonCell.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/4.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "ButtonCell.h"

@interface ButtonCell ()

@property (nonatomic, strong) UIButton *oneBtn;
@end

@implementation ButtonCell

#pragma mark - action
- (void)oneBtn_click:(UIButton *)btn
{
    
}

#pragma mark - lazy

- (UIButton *)oneBtn
{
    return GC_LAZY(_oneBtn, ({
        UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
        [view setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [view setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [view setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [view setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        [view setTitle:@"" forState:UIControlStateNormal];
        [view setTitleColor:[UIColor colorWithHexString:@""] forState:UIControlStateNormal];
        view.titleLabel.font = [UIFont systemFontOfSize:12];
        view.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [view addTarget:self action:@selector(oneBtn_click:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:view];
        view;
    }));
}


@end
