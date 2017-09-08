//
//  SCPromptingFooterView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCPromptingFooterView.h"
#import "JFTLabel.h"
@implementation SCPromptingFooterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    self.backgroundColor=Full_BackColor;
    
    UILabel *la=[JFTLabel createLabelWithText:@"看完喽，下次再逛吧" color:RGB(85, 85, 85) font:14 backgroundColor:[UIColor clearColor]];
    la.textAlignment=NSTextAlignmentCenter;
    [self addSubview:la];
    
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
    }];
}
@end
