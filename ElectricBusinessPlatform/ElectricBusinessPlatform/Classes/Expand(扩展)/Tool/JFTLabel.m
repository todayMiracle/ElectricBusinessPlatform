//
//  JFTLabel.m
//  小表哥金融
//
//  Created by 谢石长 on 17/5/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "JFTLabel.h"

@implementation JFTLabel
+(UILabel*)createLabelWithText:(NSString*)text color:(UIColor*)textcolor font:(CGFloat)font backgroundColor:(UIColor*)backcolor
{
    UILabel *la=[[UILabel alloc]init];
    la.text=text;
    la.textColor=textcolor;
    la.font=[UIFont systemFontOfSize:font];

    la.backgroundColor=backcolor;
    return la;
}
@end
