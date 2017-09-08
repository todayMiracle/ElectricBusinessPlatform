//
//  XSCGoodsSectionThirdCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/6.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsSectionThirdCell.h"
@interface XSCGoodsSectionThirdCell()
@property(nonatomic,strong)UIImageView *imageV;
@end
@implementation XSCGoodsSectionThirdCell

-(UIImageView*)imageV{
    if (_imageV==nil) {
        _imageV=[[UIImageView alloc]init];
    }
    return _imageV;
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
    self.contentView.backgroundColor=[UIColor whiteColor];
    
    [self.contentView addSubview:self.imageV];
    self.imageV.contentMode=UIViewContentModeScaleToFill;
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
        make.left.right.mas_equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}
-(void)setImageStr:(NSString *)imageStr
{
    _imageStr=imageStr;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:imageStr]];
}
@end
