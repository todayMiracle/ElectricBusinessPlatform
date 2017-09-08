//
//  XSCSlidesFooterView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/7.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCSlidesFooterView.h"
#import "DCNumericalScrollView.h"
@interface XSCSlidesFooterView()<NoticeViewDelegate>
@property(nonatomic,strong)DCNumericalScrollView *numericalScroll;
@end
@implementation XSCSlidesFooterView


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    
    self.backgroundColor=[UIColor whiteColor];
    
    UIView *topV=[[UIView alloc]init];
    topV.frame=CGRectMake(0, 0, SCreenW, 1);
    topV.backgroundColor=Full_BackColor;
    [self addSubview:topV];
    
    NSArray *titles = @[@"CDDMall首单新人礼~",
                        @"github你值得拥有，欢迎点赞~",
                        @"项目持续更新中~"];
    NSArray *btnts = @[@"新人礼",
                       @"github",
                       @"点赞"];
    CGRect frame=CGRectMake(0, 1, SCreenW,self.height-10);
    _numericalScroll=[[DCNumericalScrollView alloc]initWithFrame:frame andImage:@"shouye_img_toutiao" andDataTArray:titles WithDataIArray:btnts];
    
    _numericalScroll.delegate=self;
    _numericalScroll.interval=5.0;
    [self addSubview:_numericalScroll];
    
    // 开始循环；
    [_numericalScroll startTimer];
    
    UIView *bottomV=[[UIView alloc]init];
    bottomV.frame=CGRectMake(0, _numericalScroll.height+1, SCreenW, 10);
    bottomV.backgroundColor=Full_BackColor;
    [self addSubview:bottomV];
    
}

#pragma mark---滚动代理
- (void)noticeViewSelectNoticeActionAtIndex:(NSInteger)index{
    NSLog(@"点击了头条滚动第%zd个",index);
}
@end
