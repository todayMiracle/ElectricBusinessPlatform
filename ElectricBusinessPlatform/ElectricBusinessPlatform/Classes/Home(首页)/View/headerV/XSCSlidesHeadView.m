//
//  XSCSlidesHeadView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/7.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCSlidesHeadView.h"
#import <SDCycleScrollView.h>
@interface XSCSlidesHeadView()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *XSCycleScrollview;
@end
@implementation XSCSlidesHeadView
-(SDCycleScrollView*)XSCycleScrollview{
    if (_XSCycleScrollview==nil) {
        CGRect frame=CGRectMake(0, 0, SCreenW, self.height-0.5);
        _XSCycleScrollview=[SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
        _XSCycleScrollview.bannerImageViewContentMode=UIViewContentModeScaleAspectFill;
        _XSCycleScrollview.autoScrollTimeInterval=3.0;
    _XSCycleScrollview.imageURLStringsGroup=@[@"slideshow01",@"slideshow02",@"slideshow03"];
        
        
        
    }
    return _XSCycleScrollview;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.backgroundColor=RGB(229, 96, 130);
    
    [self addSubview:self.XSCycleScrollview];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}
@end
