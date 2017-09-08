//
//  XSCGoodsSurplusCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/6.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsSurplusCell.h"
#import "XSCGoodsSurplusModel.h"
#import "JFTLabel.h"
@interface XSCGoodsSurplusCell()
@property(nonatomic,strong)UILabel *priceLa;
@property(nonatomic,strong)UILabel *stockLa;// 剩余件数
@property(nonatomic,strong)UIImageView *shoppingImageV;
@property(nonatomic,strong)UILabel *tagLa;
@end
@implementation XSCGoodsSurplusCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setModel:(XSCGoodsSurplusModel *)model
{
    _model=model;
    self.stockLa.text=[NSString stringWithFormat:@"仅剩：%@件",model.stock];
    self.priceLa.text=[NSString stringWithFormat:@"¥ %@",model.price];
    [self.shoppingImageV sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:nil];
    self.tagLa.text=model.nature;
    
}


-(void)setUI
{
    [self.contentView addSubview:self.stockLa];
    [self.stockLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    [self.contentView addSubview:self.priceLa];
    [self.priceLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.stockLa.mas_top).offset(-3);
    }];
    
    [self.contentView addSubview:self.shoppingImageV];
    [self.shoppingImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.priceLa.mas_top).offset(-3);
        make.left.equalTo(self.contentView.mas_left).offset(8);
        make.right.equalTo(self.contentView.mas_right).offset(-8);
        make.top.equalTo(self.contentView.mas_top).offset(8);
    }];
    
    [self.contentView addSubview:self.tagLa];
    [self.tagLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(3);
        make.right.equalTo(self.shoppingImageV.mas_centerX).offset(-5);
        make.bottom.equalTo(self.shoppingImageV.mas_bottom);
    }];
    
}



-(UILabel*)stockLa{
    if (_stockLa==nil) {
        _stockLa=[JFTLabel createLabelWithText:@"" color:RGB(86, 86, 86) font:12 backgroundColor:[UIColor clearColor]];
        _stockLa.textAlignment=NSTextAlignmentCenter;
    }
    return _stockLa;
}
-(UILabel*)priceLa{
    if (_priceLa==nil) {
        _priceLa=[JFTLabel createLabelWithText:@"" color:RGB(25, 25, 25) font:14 backgroundColor:[UIColor clearColor]];
        _priceLa.textAlignment=NSTextAlignmentCenter;
    }
    return _priceLa;
}

-(UILabel*)tagLa{
    if (_tagLa==nil) {
        _tagLa=[JFTLabel createLabelWithText:@"" color:[UIColor whiteColor] font:12 backgroundColor:[UIColor redColor]];
        _tagLa.textAlignment=NSTextAlignmentCenter;
    }
    return _tagLa;
}

-(UIImageView*)shoppingImageV{
    if (_shoppingImageV==nil) {
        _shoppingImageV=[[UIImageView alloc]init];
    }
    return _shoppingImageV;
}

@end
