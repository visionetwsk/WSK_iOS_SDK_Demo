//
//  ViewController.m
//  UseWskSDKProj
//
//  Created by 焱 孙 on 16/7/26.
//  Copyright © 2016年 焱 孙. All rights reserved.
//

#import "ViewController.h"
#import <WskChatSDK/WskChatSDK.h>
#import "UIImageView+WebCache.h"

@interface ViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.imageViewTest sd_setImageWithURL:[NSURL URLWithString:@"http://vn-functional.chinacloudapp.cn/wsk2//downloadFile/2016-09-06/image/c2641b32-3790-4d03-87a7-3f940286e214-6281.jpg"]];
    
    self.title = @"微上客";
    [self setWskSDKUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setWskSDKUI {
    //设置聊天背景
    UIImage *backgroundImage = [[UIImage imageNamed:@"session_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeTile];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [[WSKSDK sharedSDK] customUIConfig].sessionBackground = imageView;
}

- (IBAction)pushControllerAction:(id)sender {
    //设置用户信息
    WSKUserVo *userVo = [[WSKUserVo alloc]init];
//        userVo.strUserID = @"45471429667";
//        userVo.strUserName = @"游客1";
    
    userVo.strUserID = @"45471429666";
    userVo.strUserName = @"iOS_SDK_用户1";
    
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
    
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)presentControllerAction:(id)sender {
    //设置用户信息
    WSKUserVo *userVo = [[WSKUserVo alloc]init];
    
//        userVo.strUserID = @"45471429667";
//        userVo.strUserName = @"游客1";
    
    userVo.strUserID = @"45471429666";
    userVo.strUserName = @"iOS_SDK_用户1";
    
    [[WSKSDK sharedSDK] setUserInfo:userVo];
    
    //启动聊天界面
    WSKChatViewController *chatViewController = [[WSKSDK sharedSDK] chatViewController];
    chatViewController.chatTitle = @"微上客SDK测试";
    //文字
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(onBack:)];
    backButton.tintColor = [UIColor redColor];
    chatViewController.navigationItem.leftBarButtonItem = backButton;
    
    //图片
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_present_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onBack:)];
//    backButton.tintColor = [UIColor greenColor];
//    chatViewController.navigationItem.leftBarButtonItem = backButton;

    //自定义视图(自定义视图设置target、action无效，需要类似添加UIButton控件处理事件)
    //...
    
    UINavigationController *navController  = [[UINavigationController alloc] initWithRootViewController:chatViewController];
    [self presentViewController:navController animated:YES completion:nil];
}

//注销操作
- (IBAction)logout:(id)sender {
    [[WSKSDK sharedSDK] logout:^{
        NSLog(@"注销成功！");
    }];
}

- (void)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onPop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
