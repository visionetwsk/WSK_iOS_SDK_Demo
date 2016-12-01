//
//  ViewController.m
//  UseWskSDKProj
//
//  Created by 焱 孙 on 16/7/26.
//  Copyright © 2016年 焱 孙. All rights reserved.
//

#import "ViewController.h"
#import <WSKChatSDK/WSKChatSDK.h>
#import "Common.h"
#import "CommonNavigationController.h"

@interface ViewController () {
    BOOL isDefaultLayout;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"微上客 Demo";
    isDefaultLayout = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//自定义UI
- (void)setWskSDKUI {
    //消息颜色
    [[WSKSDK sharedSDK] customUIConfig].serviceMessageTextColor = [UIColor blackColor];
    [[WSKSDK sharedSDK] customUIConfig].customMessageTextColor = [UIColor whiteColor];
    
    //设置聊天背景
    UIImage *backgroundImage = [[UIImage imageNamed:@"chat_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [[WSKSDK sharedSDK] customUIConfig].chatBackground = imageView;
    
    //设置自定义气泡
    [[WSKSDK sharedSDK] customUIConfig].customerMessageBubbleNormalImage = [[UIImage imageNamed:@"icon_sender_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,30,30) resizingMode:UIImageResizingModeStretch];
    [[WSKSDK sharedSDK] customUIConfig].customerMessageBubblePressedImage = [[UIImage imageNamed:@"icon_sender_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,15,30,30) resizingMode:UIImageResizingModeStretch];
    [[WSKSDK sharedSDK] customUIConfig].serviceMessageBubbleNormalImage = [[UIImage imageNamed:@"icon_receiver_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,30,30,15) resizingMode:UIImageResizingModeStretch];
    [[WSKSDK sharedSDK] customUIConfig].serviceMessageBubblePressedImage = [[UIImage imageNamed:@"icon_receiver_node"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,30,30,15) resizingMode:UIImageResizingModeStretch];
    
    //提示文字颜色和背景颜色
    [[WSKSDK sharedSDK] customUIConfig].tipMessageTextColor = [UIColor colorWithRed:163/255.0 green:175/255.0 blue:183/255.0 alpha:1.0];
    [[WSKSDK sharedSDK] customUIConfig].tipMessageBackgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0];
    
    //时间颜色
    [[WSKSDK sharedSDK] customUIConfig].messageTimeColor = [UIColor colorWithRed:163/255.0 green:175/255.0 blue:183/255.0 alpha:1.0];
    
    //输入框文字颜色
    [[WSKSDK sharedSDK] customUIConfig].inputTextColor = [UIColor blackColor];
    
    //客户头像URL
    [[WSKSDK sharedSDK] customUIConfig].customerHeadURL = [NSURL URLWithString:@"http://visionet.findest.com/letsdesk/assets/img/logo-1.png"];
    //客户头像
    [[WSKSDK sharedSDK] customUIConfig].customerHeadImage = [UIImage imageNamed:@"customer_avatar"];
    
    //默认进入聊天界面键盘弹起
    [[WSKSDK sharedSDK] customUIConfig].isShowKeyboard = YES;
}

- (IBAction)pushControllerAction:(id)sender {
    //设置用户信息
    WSKUserVo *userVo = [[WSKUserVo alloc]init];
        userVo.strUserID = @"45471429667";    //开发账号
        userVo.strUserName = @"iOS_SDK_用户2";
    
//    userVo.strUserID = @"45471429666";  //娜娜：测试账号
//    userVo.strUserName = @"iOS_SDK_用户1";
    
    [[WSKSDK sharedSDK] setUserInfo:userVo];
    
    //启动聊天界面
    WSKChatViewController *chatViewController = [[WSKSDK sharedSDK] chatViewController];
    chatViewController.chatTitle = @"微上客SDK测试";
    
    //文字
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回1" style:UIBarButtonItemStylePlain target:self action:@selector(onPop:)];
//    backButton.tintColor = [UIColor redColor];
//    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
//    图片
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_nav_icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onPop:)];
    backButton.tintColor = [UIColor colorWithRed:66.0/255 green:133.0/255 blue:244.0/255 alpha:1.0];
    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
    
    [chatViewController.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:98.0/255 green:168.0/255 blue:234.0/255 alpha:1.0]];
    
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)presentControllerAction:(id)sender {
    //设置用户信息
    WSKUserVo *userVo = [[WSKUserVo alloc]init];
    userVo.strUserID = @"45471429667";    //开发账号
    userVo.strUserName = @"iOS_SDK_用户2";
    
//        userVo.strUserID = @"45471429666";  //娜娜：测试账号
//        userVo.strUserName = @"iOS_SDK_用户1";
    
    [[WSKSDK sharedSDK] setUserInfo:userVo];
    
    //启动聊天界面
    WSKChatViewController *chatViewController = [[WSKSDK sharedSDK] chatViewController];
    chatViewController.chatTitle = @"微上客SDK测试";
    //文字
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(onBack:)];
    backButton.tintColor = [UIColor greenColor];
    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
    //图片
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_present_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack:)];
//    backButton.tintColor = [UIColor greenColor];
//    chatViewController.navigationItem.leftBarButtonItem = backButton;

    //自定义视图(自定义视图设置target、action无效，需要类似添加UIButton控件处理事件)
    //...
    
    UINavigationController *navigationController  = [[UINavigationController alloc] initWithRootViewController:chatViewController];
    [navigationController.navigationBar setBackgroundImage:[Common getImageWithColor:[UIColor colorWithRed:18/255.0 green:183/255.0 blue:246/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
//    navigationController.navigationBar.translucent = NO;
    [self presentViewController:navigationController animated:YES completion:nil];
}

//注销操作
- (IBAction)logout:(id)sender {
    [[WSKSDK sharedSDK] logout:^{
        NSLog(@"注销成功！");
    }];
}

//切换聊天样式
- (IBAction)switchChatLayout:(id)sender {
    isDefaultLayout = !isDefaultLayout;
    if (isDefaultLayout) {
        //重置为默认UI
        [[[WSKSDK sharedSDK] customUIConfig] resetUIConfig];
    } else {
        //自定义UI
        [self setWskSDKUI];
    }
}

- (void)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onPop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
