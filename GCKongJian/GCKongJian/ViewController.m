//
//  ViewController.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/4.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (strong, nonatomic) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


#pragma mark - lazy
- (UITableView *)tableView
{
    return GC_LAZY(_tableView, ({
        UITableView *view = [[UITableView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.showsVerticalScrollIndicator = NO;
        view.dataSource = self;
        view.delegate = self;
        [self.view addSubview:view];
        view;
    }));
}


@end
