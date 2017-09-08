//
//  XSCGoodsCountDownCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/8/28.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsCountDownCell.h"
#import "XSCGoodsSurplusCell.h"
#import "XSCGoodsSurplusModel.h"
@interface XSCGoodsCountDownCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *countDownColectV;
@property(nonatomic,strong)UIView *bottomLine;
/*
 *模型数据数组
 */
@property(nonatomic,strong)NSMutableArray<XSCGoodsSurplusModel*> *SurplusArray;
@end

static NSString *const XSCGoodsSurplusCellID = @"XSCGoodsSurplusCell";

@implementation XSCGoodsCountDownCell

-(UICollectionView*)countDownColectV{
    if (_countDownColectV==nil) {
        UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
        flow.minimumLineSpacing=1;
        flow.itemSize=CGSizeMake(self.height*0.65, self.height*0.9);
        flow.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
        
        _countDownColectV=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flow];
        [self.contentView addSubview:_countDownColectV];
        
        _countDownColectV.frame=self.bounds;
        _countDownColectV.showsHorizontalScrollIndicator=NO;
        _countDownColectV.delegate=self;
        _countDownColectV.dataSource=self;
        
        [_countDownColectV registerClass:[XSCGoodsSurplusCell class] forCellWithReuseIdentifier:XSCGoodsSurplusCellID];
        
    }
    return _countDownColectV;
}
-(NSMutableArray<XSCGoodsSurplusModel *>*)SurplusArray{
    if (_SurplusArray==nil) {
        _SurplusArray=[NSMutableArray array];
    }
    return _SurplusArray;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.contentView.backgroundColor=[UIColor whiteColor];
    
    self.countDownColectV.backgroundColor=[UIColor whiteColor];
    NSArray *countDownArray=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CountDownShop.plist" ofType:nil]];
    
    _SurplusArray=[XSCGoodsSurplusModel mj_objectArrayWithKeyValuesArray:countDownArray];
    
    // 加底部线条；
    _bottomLine=[[UIView alloc]init];
    _bottomLine.backgroundColor=Full_BackColor;
    [self.contentView addSubview:_bottomLine];
    _bottomLine.frame=CGRectMake(0, self.height-8, SCreenW, 8);
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.SurplusArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XSCGoodsSurplusCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsSurplusCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[XSCGoodsSurplusCell alloc]init];
    }
    cell.model=self.SurplusArray[indexPath.row];
    
    return cell;
}
@end
