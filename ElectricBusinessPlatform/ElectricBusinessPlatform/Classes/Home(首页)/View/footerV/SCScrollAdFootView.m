//
//  SCScrollAdFootView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCScrollAdFootView.h"
#import <SDCycleScrollView.h>
@interface SCScrollAdFootView()<SDCycleScrollViewDelegate>

@end
@implementation SCScrollAdFootView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    CGRect frame=CGRectMake(0, 0, self.width, self.height);
    SDCycleScrollView *cycleScroll=[SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
    cycleScroll.bannerImageViewContentMode=UIViewContentModeScaleAspectFill;
    cycleScroll.autoScrollTimeInterval=5.0;
    cycleScroll.imageURLStringsGroup=@[@"http://gfs4.gomein.net.cn/T1DZAvBQbg1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1CoJvBXV_1RCvBVdK.jpg",@"http://gfs3.gomein.net.cn/T1C.EvBjJ_1RCvBVdK.jpg"];
    
    [self addSubview:cycleScroll];
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击图片回调---第%zd",index);
}
@end
