//
//  XSCTabBarVC.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/8/2.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCTabBarVC.h"
#import "XSCTabBar.h"
#import "XSCHomeVC.h"
#import "XSCCategoryVC.h"
#import "XSCShoppingCarVC.h"
#import "XSCMyAccountVC.h"
#import "XSCNavigationController.h"
@interface XSCTabBarVC ()<UITabBarControllerDelegate>

@end

@implementation XSCTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setAllController];
    
    self.delegate=self;
    [self setMyTabBar];
    
    [self  addXSCChildViewController];
}
#pragma mark --  初始化方法二  -----自定义tabBar
-(void)setMyTabBar
{
    XSCTabBar *tab=[[XSCTabBar alloc]init];
    tab.backgroundColor=[UIColor whiteColor];
    
    // KVC 移除系统自带的tabBar;
    [self setValue:tab forKey:@"tabBar"];
    
}
-(void)addXSCChildViewController
{
    NSArray *childArray=@[ @{MallClassKey  : @"XSCHomeVC",
                             MallTitleKey  : @"首页",
                             MallImgKey    : @"tabr_01_up",
                             MallSelImgKey : @"tabr_01_down"},
                           
                           @{MallClassKey  : @"XSCCategoryVC",
                             MallTitleKey  : @"分类",
                             MallImgKey    : @"tabr_02_up",
                             MallSelImgKey : @"tabr_02_down"},
                           
                           @{MallClassKey  : @"XSCShoppingCarVC",
                             MallTitleKey  : @"购物车",
                             MallImgKey    : @"tabr_04_up",
                             MallSelImgKey : @"tabr_04_down"},
                           
                           @{MallClassKey  : @"XSCMyAccountVC",
                             MallTitleKey  : @"我的",
                             MallImgKey    : @"tabr_05_up",
                             MallSelImgKey : @"tabr_05_down"},
                           ];
    
    [childArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *VC=[NSClassFromString(dict[MallClassKey]) new];
        VC.view.backgroundColor=[UIColor whiteColor];
        VC.navigationItem.title=([dict[MallTitleKey] isEqualToString:@"首页"] || [dict[MallTitleKey] isEqualToString:@"分类"])?nil:dict[MallTitleKey];
        XSCNavigationController *na=[[XSCNavigationController alloc]initWithRootViewController:VC];
        UITabBarItem *item=na.tabBarItem;
        item.image=[UIImage imageNamed:dict[MallImgKey]];
        item.selectedImage=[[UIImage imageNamed:dict[MallSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        item.imageInsets=UIEdgeInsetsMake(6, 0, -6, 0);
        
        [self addChildViewController:na];
    }];
}

#pragma mark---代理方法 ---
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    //点击tabBarItem动画；
    [self tabBarButtonClick:[self getTabBarButton]];
}
-(UIControl *)getTabBarButton
{
    NSMutableArray *tabBarButtons=[[NSMutableArray alloc] initWithCapacity:0];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtons addObject:tabBarButton];
        }
    }
    
    UIControl *tabBarButton=[tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}
#pragma makr--设置点击动画
-(void)tabBarButtonClick:(UIControl*)control
{
    for (UIView *imageView in control.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            // 需要实现的帧动画；
            CAKeyframeAnimation *animation=[CAKeyframeAnimation animation];
            animation.keyPath=@"transform.scale";
            animation.values=@[@1.0,@1.1,@0.9,@1.0];
            animation.duration=0.3;
            animation.calculationMode=kCAAnimationCubic;
            
            // 添加动画;
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}
#pragma mark --  初始化方法一
-(void)setAllController
{
    
    NSMutableDictionary *arrtsDic=[NSMutableDictionary dictionary];
    arrtsDic[NSFontAttributeName]=[UIFont  systemFontOfSize:14];
    arrtsDic[NSForegroundColorAttributeName]=[UIColor blackColor];
    
    
    NSMutableDictionary *SelarrtsDic=[NSMutableDictionary dictionary];
    SelarrtsDic[NSFontAttributeName]=arrtsDic[NSFontAttributeName];
    SelarrtsDic[NSForegroundColorAttributeName]=[UIColor redColor];
    
    UITabBarItem *item=[UITabBarItem appearance];
    [item setTitleTextAttributes:arrtsDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:SelarrtsDic forState:UIControlStateSelected];
    
    [self setOneVControler:[[XSCHomeVC alloc] init] Title:@"" Image:@"tabr_01_up" SelectedImage:@"tabr_01_down"];
     [self setOneVControler:[[XSCCategoryVC alloc] init] Title:@"" Image:@"tabr_02_up" SelectedImage:@"tabr_02_down"];
      [self setOneVControler:[[XSCShoppingCarVC alloc] init] Title:@"" Image:@"tabr_04_up" SelectedImage:@"tabr_04_down"];
      [self setOneVControler:[[XSCMyAccountVC alloc] init] Title:@"" Image:@"tabr_05_up" SelectedImage:@"tabr_05_down"];
}

-(void)setOneVControler:(UIViewController*)VC Title:(NSString*)title Image:(NSString*)imageStr SelectedImage:(NSString*)selImage{
    VC.tabBarItem.title=title;
    VC.tabBarItem.image=[[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage=[[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.view.backgroundColor=[UIColor colorWithRed:233/255.f green:233/255.f blue:233/255.f alpha:1.0];
    XSCNavigationController *na=[[XSCNavigationController alloc]initWithRootViewController:VC];
    [self addChildViewController:na];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
