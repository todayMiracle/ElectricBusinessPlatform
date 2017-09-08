//
//  XSCGoodsGridCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/8/28.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsGridCell.h"
#import "JFTLabel.h"
#import "XSCGoodsGridsModel.h"

@interface XSCGoodsGridCell()
@property(nonatomic,strong)UILabel *titleLa;
@property(nonatomic,strong)UIImageView *imageV;
@end
@implementation XSCGoodsGridCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setModel:(XSCGoodsGridsModel *)model
{
    _model=model;
    self.titleLa.text=model.gridTitle;
   [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.iconImage] placeholderImage:nil];
}
-(void)setUI{
    
    
    
    [self.contentView addSubview:self.titleLa];
    [self.titleLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(25);
    }];

    
    CGFloat w=self.contentView.height-25-11;
    [self.contentView addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.titleLa.mas_top).offset(-3);
        make.width.height.mas_equalTo(w);
        
    }];
    
    
}

-(UILabel*)titleLa{
    if (_titleLa==nil) {
        _titleLa=[JFTLabel createLabelWithText:@"" color:[UIColor blackColor] font:13 backgroundColor:[UIColor clearColor]];
        _titleLa.textAlignment=NSTextAlignmentCenter;
    }
    return _titleLa;
}

-(UIImageView*)imageV{
    if (_imageV==nil) {
        _imageV=[[UIImageView alloc]init];
        
    }
    return _imageV;
}


@end
