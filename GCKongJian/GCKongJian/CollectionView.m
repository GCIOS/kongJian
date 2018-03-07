//
//  CollectionView.m
//  GCKongJian
//
//  Created by 高崇 on 2018/3/7.
//  Copyright © 2018年 LieLvWang. All rights reserved.
//

#import "CollectionView.h"
#import "WSFaLvWenShuCollectionViewSortCell.h"

@interface CollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation CollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup
{
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self).offset(44);
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArrM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTContractModel *model = self.dataArrM[indexPath.item];
    WSFaLvWenShuCollectionViewSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WSFaLvWenShuCollectionViewSortCell" forIndexPath:indexPath];
    cell.contractModel = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTContractModel *contractModel = self.dataArrM[indexPath.item];
    HUFLWSDetailViewController *vc = [[HUFLWSDetailViewController alloc] init];
    vc.contractId = contractModel.ID;
    [self.navViewController pushViewController:vc animated:YES];
}


#pragma mark - lazy

- (UICollectionView *)collectionView
{
    return GC_LAZY(_collectionView, ({
        
        CGFloat scale = 385.0/275;
        CGFloat imgViewW = (kScreenWidth - 10*4 - 5)* 0.5;
        CGFloat imgViewH = imgViewW * scale;
        CGFloat bottomH = 80;
        CGFloat w = imgViewW + 10*2;
        CGFloat h = imgViewH + bottomH + 10;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(w, h);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
        view.delegate = self;
        view.dataSource = self;
        [view registerClass:[WSFaLvWenShuCollectionViewSortCell class] forCellWithReuseIdentifier:@"WSFaLvWenShuCollectionViewSortCell"];
        [self addSubview:view];
        view;
    }));
}

@end
