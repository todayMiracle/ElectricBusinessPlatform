//
//  NormalButton.m
//  xbg_ios
//
//  Created by 谢石长 on 17/5/19.
//  Copyright © 2017年 官焘. All rights reserved.
//

#import "NormalButton.h"

@implementation NormalButton
+(UIButton*)createButtonWithText:(NSString*)text textColor:(UIColor*)textcolor font:(CGFloat)font backgroundColor:(UIColor*)color
{
    UIButton *Btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [Btn setTitle:text forState:UIControlStateNormal];
    Btn.titleLabel.font=[UIFont systemFontOfSize:font];
//    [Btn setBackgroundColor:color forState:UIControlStateNormal];
    [Btn setTitleColor:textcolor forState:UIControlStateNormal];
  
    return Btn;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
