//
//  CommonNavigationController.m
//  UseWskSDKProj
//
//  Created by 焱 孙 on 2016/9/27.
//  Copyright © 2016年 焱 孙. All rights reserved.
//

#import "CommonNavigationController.h"
#import "Common.h"

@interface CommonNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation CommonNavigationController

+ (void)initialize
{
    //设置导航栏的颜色
//    [[UINavigationBar appearance] setBackgroundImage:[Common getImageWithColor:[UIColor colorWithRed:18/255.0 green:183/255.0 blue:246/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
    //禁用分割线
//    [UINavigationBar appearance].shadowImage = [UIImage new];
    //设置半透明效果
//    [UINavigationBar appearance].translucent = NO;
    
//    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //边缘滑动（当leftBarButtonItem被覆盖也可以滑动）
    self.interactivePopGestureRecognizer.delegate = self;
}

// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
