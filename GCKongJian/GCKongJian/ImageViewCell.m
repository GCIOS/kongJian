//
//  ImageViewCell.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/4.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "ImageViewCell.h"

@interface ImageViewCell ()
@property (nonatomic, strong) UIImageView *iconView;
@end

@implementation ImageViewCell

#pragma mark - lazy

- (UIImageView *)iconView
{
    return GC_LAZY(_iconView, ({
        UIImageView *view = [[UIImageView alloc] init];
        view.image = [UIImage imageNamed:@""];
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = YES;
        view.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:view];
        view;
    }));
}

@end
