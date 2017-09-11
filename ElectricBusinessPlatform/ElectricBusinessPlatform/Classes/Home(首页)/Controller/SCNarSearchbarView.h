//
//  SCNarSearchbarView.h
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/9.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCNarSearchbarView : UIView
@property(nonatomic,strong)UIButton *voiceBtn;

// 占位文字;
@property(nonatomic,strong)UILabel *searchPlaceHoldLa;

// 语音点击回调；
@property(nonatomic,copy)dispatch_block_t voiceButtonClick;

// 搜索回调；

@property(nonatomic,copy)dispatch_block_t searchButtonClick;


@end
