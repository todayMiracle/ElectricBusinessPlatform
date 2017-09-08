//
//  SCGoodsTagHeadView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCGoodsTagHeadView.h"
@interface SCGoodsTagHeadView()

@end
@implementation SCGoodsTagHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
   
   
    [self addSubview:self.TagBtn];
    [self.TagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(85);
    }];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
//     CGFloat w=100;
//     self.TagBtn.frame=CGRectMake((SCreenW-w)/2,4, w, 32);
}
-(SCRightImglefttitleBtn*)TagBtn{
    if (_TagBtn==nil) {
        _TagBtn=[SCRightImglefttitleBtn buttonWithType:UIButtonTypeCustom];
        _TagBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    }
    return _TagBtn;
}

@end
