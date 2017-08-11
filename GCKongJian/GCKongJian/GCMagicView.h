//
//  GCMagicView.h
//  GCKongJian
//
//  Created by 高崇 on 2017/8/10.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCMagicView;
@protocol GCMagicViewDelegate <NSObject>

@required
- (NSArray< NSString *> *)menuTitlesForMagicView:(GCMagicView *)magicView;

- (UIButton *)menuItemForMagicView:(GCMagicView *)magicView;

- (void)magicView:(GCMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex;
@end

@interface GCMagicView : UIView

@property (nonatomic, weak, nullable) id<GCMagicViewDelegate> delegate;
@end
