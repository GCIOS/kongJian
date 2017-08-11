//
//  GCMagicView.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/10.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "GCMagicView.h"

@interface GCMagicView ()
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UIView *sliderView; // 顶部导航栏滑块
@property (nonatomic, strong) UIButton *preBtn;

@end

@implementation GCMagicView

#pragma mark - Lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setDelegate:(id<GCMagicViewDelegate>)delegate
{
    _delegate = delegate;
    [self addMagicSubviews];
}

- (void)addMagicSubviews {
    [self addSubview:self.navigationView];
    [_navigationView addSubview:self.sliderView];
    
    NSArray *titles = [self.delegate menuTitlesForMagicView:self];
    CGFloat w = self.frame.size.width / titles.count;
    CGFloat h = self.frame.size.height;
    
    for (int i = 0; i < titles.count; i++) {
        UIButton *btn = [self.delegate menuItemForMagicView:self];
        btn.tag = i;
        btn.frame = CGRectMake(w * i, 0, w, h);
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationView addSubview:btn];
        if (i == 0) {
            [self btn_click:btn];
        }
    }
}

#pragma mark - action
- (void)btn_click:(UIButton* )sender
{
    if (self.preBtn == sender) return;
    self.preBtn.selected = NO;
    sender.selected = YES;
    self.preBtn = sender;
    [UIView animateWithDuration:0.25 animations:^{
        _sliderView.frame = CGRectMake(sender.frame.origin.x, (self.bounds.size.height - 1), sender.frame.size.width, 1);
    }];
    
    [self.delegate magicView:self didSelectItemAtIndex:sender.tag];
    
}

#pragma mark - lazy

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] init];
        _navigationView.backgroundColor = [UIColor clearColor];
        _navigationView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _navigationView.clipsToBounds = YES;
    }
    return _navigationView;
}
- (UIView *)sliderView {
    if (!_sliderView) {
        _sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
        _sliderView.backgroundColor = [UIColor orangeColor];
    }
    return _sliderView;
}
@end
