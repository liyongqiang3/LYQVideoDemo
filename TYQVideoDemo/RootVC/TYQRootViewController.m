//
//  TYQRootViewController.m
//  TYQVideoDemo
//
//  Created by yongqiang li on 2019/1/6.
//  Copyright © 2019 yongqiang. All rights reserved.
//

#import "TYQRootViewController.h"
#import "LYQHomeTabViewController.h"
#import "LYQMeViewController.h"
#import "LYQMVVMViewController.h"
#import "LYQHomeViewController.h"

@interface TYQRootViewController ()<UITabBarControllerDelegate>

@property (nonatomic) LYQHomeTabViewController *homeTabViewController;
@property (nonatomic) UINavigationController *rootNavigationController;

@end

@implementation TYQRootViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _homeTabViewController = [LYQHomeTabViewController new];
        _homeTabViewController.delegate = self;
        _homeTabViewController.tabBar.barTintColor = [UIColor whiteColor];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:_homeTabViewController];
        LYQHomeViewController *homeVC =  [[LYQHomeViewController alloc] init];
        homeVC.tabBarItem  = [self itemImage:[UIImage imageNamed:@"home_bar"] selectedImage:[UIImage imageNamed:@"homed_bar"]];
        LYQMVVMViewController *mvvmVC =  [[LYQMVVMViewController alloc] init];
        mvvmVC.tabBarItem =  [self itemImage:[UIImage imageNamed:@"msg_bar"] selectedImage:[UIImage imageNamed:@"msgd_bar"]];
        LYQMeViewController *meVC =  [[LYQMeViewController alloc] init];
        meVC.tabBarItem =  [self itemImage:[UIImage imageNamed:@"me_bar"] selectedImage:[UIImage imageNamed:@"med_bar"]];
        _homeTabViewController.viewControllers = @[homeVC,mvvmVC,meVC];
        _rootNavigationController = navigationController;
        navigationController.navigationBarHidden = YES;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
        [self addChildViewController:navigationController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.rootNavigationController.view];
    [self.rootNavigationController didMoveToParentViewController:self];
}

- (UITabBarItem *)itemImage:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:nil image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tabbarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
//    tabbarItem.redDotOffset = CGPointMake(0, 6);
//    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    customButton.contentEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4);
//    customButton.userInteractionEnabled = NO;
//    customButton.titleLabel.font = fontPingFangMedium(10);
//    [customButton setTitleColor:colorWhite forState:UIControlStateNormal];
//    [customButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(18);
//        make.width.mas_greaterThanOrEqualTo(18);
//    }];
//    customButton.bounds = CGRectMake(0, 0, 18, 18);
//    tabbarItem.customView = customButton;
    return tabbarItem;
}



@end
