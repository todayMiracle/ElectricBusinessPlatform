//
//  SCNarSearchbarView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/9.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCNarSearchbarView.h"
#import "JFTLabel.h"
@interface SCNarSearchbarView()

@end

@implementation SCNarSearchbarView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchClick)]];
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.1];
    
    [self addSubview:self.voiceBtn];
    [self.voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(22);
    }];
    
    
    
    [self addSubview:self.searchPlaceHoldLa];
    [self.searchPlaceHoldLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.voiceBtn.mas_left).offset(-8);
    }];
    
  
   
    
    
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    UIBezierPath *maskpath=[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft |UIRectCornerBottomRight cornerRadii:CGSizeMake(2, 2)];
    
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
    maskLayer.frame=self.bounds;
    maskLayer.path=maskpath.CGPath;
    self.layer.mask=maskLayer;
    
}
-(UIButton*)voiceBtn{
    if (_voiceBtn==nil) {
        _voiceBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_voiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateNormal];
        [_voiceBtn setImage:[UIImage imageNamed:@"voice"] forState:UIControlStateHighlighted];
        [_voiceBtn addTarget:self action:@selector(voiceClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _voiceBtn;
}

-(UILabel*)searchPlaceHoldLa{
    if (_searchPlaceHoldLa==nil) {
        _searchPlaceHoldLa=[JFTLabel createLabelWithText:@"" color:[UIColor whiteColor] font:14 backgroundColor:[UIColor clearColor]];
    }
    return _searchPlaceHoldLa;
}

-(void)voiceClick{
    !_voiceButtonClick? :_voiceButtonClick();
}

-(void)searchClick{
    !_searchButtonClick? :_searchButtonClick();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
