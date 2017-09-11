//
//  SCGoodsSetTwoCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/9.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCGoodsSetTwoCell.h"
#import "JFTLabel.h"
#import "SCGoodsSetModel.h"
@interface SCGoodsSetTwoCell()
@property(nonatomic,strong)UIImageView *goodsImageV;
@property(nonatomic,strong)UILabel *tagLa;
@property(nonatomic,strong)UILabel *NameLa;
@property(nonatomic,strong)UILabel *setMealla;
@property(nonatomic,strong)UILabel *priceLa;
@property(nonatomic,strong)UILabel *conmendsNumberLa;

@end
@implementation SCGoodsSetTwoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setListModel:(SCGoodsSetModel *)listModel
{
    _listModel=listModel;
    self.tagLa.text=@"自营";
    self.NameLa.text=[NSString stringWithFormat:@"%@",listModel.main_title];
    self.setMealla.text=@"优惠套餐";
    self.priceLa.text=[NSString stringWithFormat:@"¥ %@",listModel.price];
    NSInteger nauber=arc4random_uniform(5000);
    self.conmendsNumberLa.text=[NSString stringWithFormat:@"%zd人已评价",nauber];
    
    [self.goodsImageV sd_setImageWithURL:[NSURL URLWithString:listModel.image_url]];
}
-(void)setUI{
    self.contentView.backgroundColor=Full_BackColor;
    UIView *bgV=[[UIView alloc]init];
    bgV.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:bgV];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-2);
    }];
    
    [bgV addSubview:self.goodsImageV];
    [self.goodsImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.width.mas_equalTo(85);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-15);
    }];
   
    
    
   
    
    [bgV addSubview:self.conmendsNumberLa];
    [self.conmendsNumberLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImageV.mas_right).offset(15);
        make.bottom.equalTo(self.goodsImageV.mas_bottom);
        
    }];
    
    [bgV addSubview:self.priceLa];
    [self.priceLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImageV.mas_right).offset(15);
        make.bottom.equalTo(self.conmendsNumberLa.mas_top).offset(-4);
        
    }];
    
    [bgV addSubview:self.setMealla];
    [self.setMealla mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImageV.mas_right).offset(15);
        make.bottom.equalTo(self.priceLa.mas_top).offset(-3);
        
    }];
    
    [bgV addSubview:self.NameLa];
    [self.NameLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImageV.mas_right).offset(46);
        make.right.equalTo(bgV.mas_right).offset(-10);
        make.top.equalTo(self.goodsImageV.mas_top).offset(0);
        make.bottom.equalTo(self.setMealla.mas_top).offset(-3);
    }];
    
    [bgV addSubview:self.tagLa];
    [self.tagLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImageV.mas_right).offset(15);
        make.right.equalTo(self.NameLa.mas_left).offset(-3);
        make.top.equalTo(self.NameLa.mas_top).offset(-3);
        
    }];

}

-(UIImageView*)goodsImageV{
    if (_goodsImageV==nil) {
        _goodsImageV=[[UIImageView alloc]init];
        
    }
    return _goodsImageV;
}
-(UILabel*)tagLa{
    if (_tagLa==nil) {
        _tagLa=[JFTLabel createLabelWithText:@"" color:[UIColor redColor] font:12 backgroundColor:[UIColor clearColor]];
        _tagLa.textAlignment=NSTextAlignmentCenter;
        _tagLa.layer.borderColor=[UIColor redColor].CGColor;
        _tagLa.layer.borderWidth=1;
        
    }
    return _tagLa;
}

-(UILabel*)NameLa{
    if (_NameLa==nil) {
        _NameLa=[JFTLabel createLabelWithText:@"" color:RGB(25, 25, 25) font:13 backgroundColor:[UIColor clearColor]];
        _NameLa.numberOfLines=0;
        
    }
    return _NameLa;
}

-(UILabel*)setMealla{
    if (_setMealla==nil) {
        _setMealla=[JFTLabel createLabelWithText:@"" color:[UIColor redColor] font:11 backgroundColor:RGB(248, 195, 196)];
        
        
    }
    return _setMealla;
}

-(UILabel*)priceLa{
    if (_priceLa==nil) {
        _priceLa=[JFTLabel createLabelWithText:@"" color:[UIColor redColor] font:15 backgroundColor:[UIColor clearColor]];
        
        
    }
    return _priceLa;
}

-(UILabel*)conmendsNumberLa{
    if (_conmendsNumberLa==nil) {
        _conmendsNumberLa=[JFTLabel createLabelWithText:@"" color:[UIColor blackColor] font:11 backgroundColor:[UIColor clearColor]];
        
        
    }
    return _conmendsNumberLa;
}

@end
