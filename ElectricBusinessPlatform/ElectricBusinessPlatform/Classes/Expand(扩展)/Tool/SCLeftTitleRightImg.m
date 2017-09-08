//
//  SCLeftTitleRightImg.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCLeftTitleRightImg.h"

@implementation SCLeftTitleRightImg
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x=0;
//    self.titleLabel.SC_centerY=self.SC_centerY;
    [self.titleLabel sizeToFit];
//
//    
    self.imageView.x=CGRectGetMaxX(self.titleLabel.frame)+5;
//    self.imageView.SC_centerY=self.SC_centerY;
    [self.imageView sizeToFit];
//
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
