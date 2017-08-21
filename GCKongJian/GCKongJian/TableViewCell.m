//
//  TableViewCell.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/4.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *lineView;

@end
@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    UIView *containerView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@""];
        [self.contentView addSubview:view];
        view;
    });
    
    UIView *lineView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@""];
        [self.contentView addSubview:view];
        view;
    });
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
}

#pragma mark - lazy

- (UIView *)containerView
{
    return GC_LAZY(_containerView, ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@""];
        [self.contentView addSubview:view];
        view;
    }));
  
}

- (UIView *)lineView
{
    return GC_LAZY(_lineView, ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@""];
        [self.contentView addSubview:view];
        view;
    }));
}

@end
