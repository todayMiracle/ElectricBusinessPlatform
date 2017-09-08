//
//  categeryButton.m
//  小表哥金融
//
//  Created by 谢石长 on 17/5/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "categeryButton.h"

@implementation categeryButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentLeft;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    }
    return self;
}

#pragma mark--设置图片和文字在按钮中的位置 

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX=contentRect.size.width/4;
    CGFloat imageW=19;
    CGFloat imageH=15;
    CGFloat imageY=(contentRect.size.height-imageH)/2;
    return CGRectMake(imageX,imageY, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=contentRect.size.width/2;
   
    CGFloat titleW=contentRect.size.width/2;
    CGFloat titleH=16;
    CGFloat titleY=(contentRect.size.height-titleH)/2;
   
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
