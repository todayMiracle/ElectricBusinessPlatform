//
//  SCRightImglefttitleBtn.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCRightImglefttitleBtn.h"

@implementation SCRightImglefttitleBtn
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
    
    self.imageView.x=0;
    [self.imageView sizeToFit];
    
    self.titleLabel.x=CGRectGetMaxX(self.imageView.frame)+5;
    [self.titleLabel sizeToFit];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
