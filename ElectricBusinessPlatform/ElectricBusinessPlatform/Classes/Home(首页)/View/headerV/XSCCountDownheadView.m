//
//  XSCCountDownheadView.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/7.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCCountDownheadView.h"
#import "SCLeftTitleRightImg.h"
#import "JFTLabel.h"

@interface XSCCountDownheadView()
@property(nonatomic,strong)UIView *redView;
@property(nonatomic,strong)UILabel *timeLa;
@property(nonatomic,strong)UILabel *countDownLa;
@property(nonatomic,strong)SCLeftTitleRightImg *secondToRobBtn;
@end
@implementation XSCCountDownheadView {
    NSInteger secondsCountdown;
    
    NSTimer *countDownTimer;
}

-(UIView*)redView{
    if (_redView==nil) {
        _redView=[[UIView alloc]init];
        _redView.backgroundColor=[UIColor redColor];
    }
    return _redView;
}

-(UILabel*)timeLa{
    if (_timeLa==nil) {
        _timeLa=[JFTLabel createLabelWithText:@"6点场" color:[UIColor blackColor] font:14 backgroundColor:[UIColor clearColor]];
    }
    return _timeLa;
}
-(UILabel*)countDownLa{
    if (_countDownLa==nil) {
        _countDownLa=[JFTLabel createLabelWithText:@"05:58:36" color:[UIColor redColor] font:14 backgroundColor:[UIColor clearColor]];
    }
    return _countDownLa;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.backgroundColor=[UIColor whiteColor];
    
    [self addSubview:self.redView];
    [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.mas_equalTo(7);
        make.top.equalTo(self.mas_top).offset(8);
        make.bottom.equalTo(self.mas_bottom).offset(-8);
        
    }];
    
    [self addSubview:self.timeLa];
    [self.timeLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redView.mas_right).offset(10);
        make.centerY.equalTo(self.redView.mas_centerY);
        
    }];
    
    [self addSubview:self.countDownLa];
    [self.countDownLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLa.mas_right).offset(15);
        make.centerY.equalTo(self.timeLa.mas_centerY);
        
    }];
    
    
    _secondToRobBtn = [SCLeftTitleRightImg buttonWithType:UIButtonTypeCustom];
    _secondToRobBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondToRobBtn setImage:[UIImage imageNamed:@"shouye_icon_jiantou"] forState:UIControlStateNormal];
    [_secondToRobBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_secondToRobBtn setTitle:@"好货秒抢" forState:UIControlStateNormal];
    [self addSubview:_secondToRobBtn];
    [_secondToRobBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(70);
    }];
    
    [self setSecondsCountDown];

}

-(void)setSecondsCountDown{
    
    secondsCountdown=172800;
    
    countDownTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerCountDown) userInfo:nil repeats:YES];
    
    // 设置显示倒计时的时间;
    NSString *str_hour=[NSString stringWithFormat:@"%02ld",secondsCountdown/3600];  // 时
    NSString *str_minute=[NSString stringWithFormat:@"%02ld",(secondsCountdown%3600)/60];  // 分
    NSString *str_second=[NSString stringWithFormat:@"%02ld",secondsCountdown%60];
    
    NSString *format_time=[NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    self.countDownLa.text=format_time;
    
    
}
-(void)timerCountDown
{
    // 倒计时 -1 ;
    secondsCountdown--;
    
    NSString *str_hour=[NSString stringWithFormat:@"%02ld",secondsCountdown/3600];
    NSString *str_minute=[NSString stringWithFormat:@"%02ld",(secondsCountdown%3600)/60];
    NSString *str_second=[NSString stringWithFormat:@"%02ld",secondsCountdown%60];
    
    NSString *format_time=[NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    self.countDownLa.text=format_time;
    
    if (secondsCountdown==0) {
        [countDownTimer invalidate];
        
        self.countDownLa.text=@"已清仓";
    }
    
}
@end
