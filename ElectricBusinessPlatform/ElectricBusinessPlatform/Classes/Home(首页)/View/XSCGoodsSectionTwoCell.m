//
//  XSCGoodsSectionTwoCell.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/6.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCGoodsSectionTwoCell.h"
#import "XSCGoodsGodCell.h"
@interface XSCGoodsSectionTwoCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *sectionTwoCollectV;
@property(nonatomic,strong)UIImageView *headView;
@property(nonatomic,strong)NSArray*imageArray;
@end


static NSString *const XSCGoodsGodCellID = @"XSCGoodsGodCell";

@implementation XSCGoodsSectionTwoCell


-(UICollectionView*)sectionTwoCollectV{
    if (_sectionTwoCollectV==nil) {
        UICollectionViewFlowLayout *flow=[[UICollectionViewFlowLayout alloc]init];
        flow.minimumLineSpacing=2;
        flow.itemSize=CGSizeMake(100, 100);
        flow.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
        
        _sectionTwoCollectV=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flow];
        [self.contentView addSubview:_sectionTwoCollectV];
      
        _sectionTwoCollectV.frame=CGRectMake(0,SCreenH*0.35+10, SCreenW, 100);
      
        _sectionTwoCollectV.delegate=self;
        _sectionTwoCollectV.dataSource=self;
        _sectionTwoCollectV.showsHorizontalScrollIndicator=NO;
        
          [_sectionTwoCollectV registerClass:[XSCGoodsGodCell class] forCellWithReuseIdentifier:XSCGoodsGodCellID];
        
    }
    return _sectionTwoCollectV;
}
-(UIImageView*)headView{
    if (_headView==nil) {
        _headView=[[UIImageView alloc]init];
    }
    return _headView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setUI];
        
    }
    return self;
}

-(void)setUI{
    self.contentView.backgroundColor=[UIColor whiteColor];
    self.sectionTwoCollectV.backgroundColor=[UIColor whiteColor];
    
    [self.contentView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(SCreenH*0.35);
    }];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArray.count-1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XSCGoodsGodCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsGodCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[XSCGoodsGodCell alloc]init];
    }
    cell.imageVStr=_imageArray[indexPath.row+1];
    cell.backgroundColor=Full_BackColor;
    return cell;
}

-(void)setHandleImageS:(NSArray *)handleImageS
{
    _handleImageS=handleImageS;
    _imageArray=handleImageS;
    [self.headView sd_setImageWithURL:[NSURL URLWithString:handleImageS[0]]];
}
@end
