//
//  XSCGoodsSectionFourthCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/6.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsSectionFourthCell.h"
#import "XSCRecommendModel.h"
#import "JFTLabel.h"
@interface XSCGoodsSectionFourthCell()
@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UILabel *priceLa;
@property(nonatomic,strong)UILabel *titleLa;
@property(nonatomic,strong)UILabel *similarityLa;
@end
@implementation XSCGoodsSectionFourthCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
        
    }
    return self;
}
-(void)setUI{
    self.contentView.backgroundColor=Full_BackColor;
    
    UIView *BgV=[[UIView alloc]init];
    BgV.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:BgV];
    [BgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-4);
    }];
    
    [BgV addSubview:self.similarityLa];
    [self.similarityLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(BgV.mas_right).offset(-12);
        
        make.bottom.equalTo(BgV.mas_bottom).offset(-8);
    }];
    
    [BgV addSubview:self.priceLa];
    [self.priceLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.similarityLa.mas_right).offset(-8);
        make.left.equalTo(BgV.mas_left).offset(20);
        make.bottom.equalTo(self.similarityLa.mas_bottom).offset(0);
    }];
    
    [BgV addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(BgV.mas_right).offset(-15);
        make.left.equalTo(BgV.mas_left).offset(15);
        make.top.equalTo(BgV.mas_top).offset(10);
        make.bottom.equalTo(self.priceLa.mas_top).offset(-40);
    }];
    
    [BgV addSubview:self.titleLa];
    [self.titleLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(BgV.mas_right).offset(-10);
        make.left.equalTo(BgV.mas_left).offset(10);
        make.bottom.equalTo(self.priceLa.mas_top).offset(-3);
        make.top.equalTo(self.imageV.mas_bottom).offset(5);
    }];
    
 
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}
-(void)setModel:(XSCRecommendModel *)model
{
    _model=model;
    self.priceLa.text=[NSString stringWithFormat:@"¥ %@",model.price];
    self.titleLa.text=model.main_title;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
}
-(UIImageView*)imageV{
    if (_imageV==nil) {
        _imageV=[[UIImageView alloc]init];
    }
    return _imageV;
}

-(UILabel*)priceLa{
    if (_priceLa==nil) {
        _priceLa=[JFTLabel createLabelWithText:@"" color:RGB(248, 10, 33) font:14 backgroundColor:[UIColor clearColor]];
    }
    return _priceLa;
}

-(UILabel*)titleLa{
    if (_titleLa==nil) {
        _titleLa=[JFTLabel createLabelWithText:@"" color:RGB(25, 25, 25) font:12 backgroundColor:[UIColor clearColor]];
        _titleLa.numberOfLines=0;
    }
    return _titleLa;
}

-(UILabel*)similarityLa{
    if (_similarityLa==nil) {
        _similarityLa=[JFTLabel createLabelWithText:@"看相似" color:RGB(86, 86, 86) font:11 backgroundColor:[UIColor clearColor]];
        _similarityLa.layer.borderColor=[UIColor blackColor].CGColor;
        _similarityLa.layer.borderWidth=1;
    }
    return _similarityLa;
}
@end
