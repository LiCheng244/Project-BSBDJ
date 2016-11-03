//
//  BSTabBarController.m
//  百思不得姐
//
//  Created by LiCheng on 2016/11/1.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import "BSTabBarController.h"

#import "BSEssenceViewController.h"
#import "BSNewViewController.h"
#import "BSFriendTrendsViewController.h"
#import "BSMeViewController.h"
#import "BSTabBar.h"

@interface BSTabBarController ()

@end

@implementation BSTabBarController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 1. 通过 appearance 统一设置所有tabbaritem的文字属性
    NSMutableDictionary *attr                  = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName]                  = [UIFont systemFontOfSize:11];
    attr[NSForegroundColorAttributeName]       = [UIColor grayColor];

    NSMutableDictionary *selectAttr            = [NSMutableDictionary dictionary];
    selectAttr[NSFontAttributeName]            = attr[NSFontAttributeName];
    selectAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];

    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:(UIControlStateNormal)];
    [item setTitleTextAttributes:selectAttr forState:(UIControlStateSelected)];
    /**
        pai中 后面带有 UI_APPEARANCE_SELECTOR 的方法, 都可以通过 appearance 来统一设置属性
     */


    // 2. 添加子控制器
    BSEssenceViewController *essenceVC     = [[BSEssenceViewController alloc] init];
    [self setupChildVC:essenceVC
                 title:@"精华"
                 image:@"tabBar_essence_icon"
           selectImage:@"tabBar_essence_click_icon"];

    BSNewViewController *newVC             = [[BSNewViewController alloc] init];
    [self setupChildVC:newVC
                 title:@"新帖"
                 image:@"tabBar_new_icon"
           selectImage:@"tabBar_new_click_icon"];

    BSFriendTrendsViewController *friendVC = [[BSFriendTrendsViewController alloc] init];
    [self setupChildVC:friendVC
                 title:@"关注"
                 image:@"tabBar_me_icon"
           selectImage:@"tabBar_me_click_icon"];

    BSMeViewController *meVC               = [[BSMeViewController alloc] init];
    [self setupChildVC:meVC
                 title:@"我"
                 image:@"tabBar_friendTrends_icon"
           selectImage:@"tabBar_friendTrends_click_icon"];
    
    // 3. 更换tabBar为自定义tabBar
    BSTabBar *tabBar = [[BSTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    /**
        由于 tabBar 的属性是不可以修改的, 所以使用kvc对tabBar这个成员变量进行赋值
        当属性为 readonly 时 , 可以使用kvc来进行修改赋值
     */
}

/**
 *  设置控制器的样式
 *
 *  @param vc          控制器
 *  @param title       标题
 *  @param image       图片名称
 *  @param selectImage 选中图片名称
 */
- (void)setupChildVC:(UIViewController *)vc
               title:(NSString *)title
               image:(NSString *)image
         selectImage:(NSString *)selectImage
{
    vc.tabBarItem.title         = title;
    vc.tabBarItem.image         = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    // 包装导航栏控制, 并设置将其设置为tabBarContrller的子控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
