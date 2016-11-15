//
//  BSEssenceViewController.m
//  百思不得姐
//
//  Created by LiCheng on 2016/11/1.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import "BSEssenceViewController.h"
#import "BSRecommendTagsViewController.h"

@interface BSEssenceViewController ()

@end

@implementation BSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏左按钮
    UIBarButtonItem *leftBtn = [UIBarButtonItem itemWithImage:@"MainTagSubIcon"
                                                    highImage:@"MainTagSubIconClick"
                                                       target:self
                                                       action:@selector(leftClick)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    // 设置背景颜色
    self.view.backgroundColor = BSGlobalColor;
}

/**
 *  左按钮点击事件
 */
- (void)leftClick {
    
    BSRecommendTagsViewController *tagsVC = [[BSRecommendTagsViewController alloc] init];
    [self.navigationController pushViewController:tagsVC animated:YES];
}

@end
