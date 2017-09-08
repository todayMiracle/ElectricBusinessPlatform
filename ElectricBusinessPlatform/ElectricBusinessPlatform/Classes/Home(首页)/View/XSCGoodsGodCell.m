//
//  XSCGoodsGodCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/6.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsGodCell.h"
@interface XSCGoodsGodCell()
@property(nonatomic,strong)UIImageView *imageV;
@end
@implementation XSCGoodsGodCell
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}

-(void)setUI{
    [self.contentView addSubview:self.imageV];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
    
}

-(UIImageView*)imageV{
    
    if (_imageV==nil) {
        
        _imageV=[[UIImageView alloc]init];
        
    }
    
    return _imageV;
}

-(void)setImageVStr:(NSString *)imageVStr
{
    _imageVStr=imageVStr;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:imageVStr]];
}
@end
