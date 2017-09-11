//
//  UIBarButtonItem+SCBarButtonItem.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "UIBarButtonItem+SCBarButtonItem.h"

@implementation UIBarButtonItem (SCBarButtonItem)
+(UIBarButtonItem*)ItemWithImage:(NSString *)image withHightedImage:(NSString *)hightImage Target:(id)target Action:(SEL)action
{
    UIButton *baritem=[UIButton buttonWithType:UIButtonTypeCustom];
    [baritem setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [baritem setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    
    [baritem sizeToFit];
    
    [baritem addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *contentView=[[UIView alloc]initWithFrame:baritem.frame];
    
    [contentView addSubview:baritem];
    
    return [[UIBarButtonItem alloc]initWithCustomView:contentView];
}
@end
