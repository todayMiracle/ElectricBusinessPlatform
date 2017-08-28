//
//  XSCHomeVC.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/8/2.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "XSCHomeVC.h"

#import "XSCGoodsGridCell.h"
#import "XSCGoodsCountDownCell.h"
#import "GTCollectionViewFlowLayout.h"
#import "XSCGoodsGridsModel.h"
#import "XSCRecommendModel.h"
static NSString *const XSCGoodsGridCellID=@"XSCGoodsGridCell";
static NSString *const XSCGoodsCountDownCellID=@"XSCGoodsCountDownCell";
@interface XSCHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionV;
@property(nonatomic,strong)GTCollectionViewFlowLayout *flowLayout;
// 10个商品属性;

@property(nonatomic,strong)NSMutableArray *grisaArray;
// 推荐商品
@property(nonatomic,strong)NSMutableArray *youLikeItems;
@end

@implementation XSCHomeVC

//-(UICollectionView*)collectionV{
//    if (_collectionV==nil) {
//        GTCollectionViewFlowLayout *layout=[GTCollectionViewFlowLayout new];
//        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
//        self.flowLayout=layout;
//        
//        layout.itemSize=CGSizeMake(SCreenW/5, SCreenW/5+10);
//        layout.rowCount =2;
//        layout.itemCountPerRow=5;
//        CGRect frame=frame=CGRectMake(0, 64,SCreenW , SCreenH-64-49);
//        _collectionV=[[[UICollectionView alloc]init]initWithFrame:frame collectionViewLayout:layout];
//        _collectionV.delegate=self;
//        _collectionV.dataSource=self;
//    
//        _collectionV.showsVerticalScrollIndicator=NO;
//        
//        // 注册cell;
//        [_collectionV registerClass:[XSCGoodsGridCell class] forCellWithReuseIdentifier:XSCGoodsGridCellID];
//        [_collectionV registerClass:[XSCGoodsCountDownCell class] forCellWithReuseIdentifier:XSCGoodsCountDownCellID];
//        
//        [self.view addSubview:_collectionV];
//        
//    }
//    return _collectionV;
//}
//
-(NSMutableArray*)grisaArray{
    if (_grisaArray==nil) {
        _grisaArray=[XSCGoodsGridsModel mj_objectArrayWithFilename:@"GoodsGrid.plist"];
    }
    return _grisaArray;
}
-(NSMutableArray*)youLikeItems{
    if (_youLikeItems==nil) {
        _youLikeItems=[XSCGoodsGridsModel mj_objectArrayWithFilename:@"HomeHighGoods.plist"];
    }
    return _youLikeItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCollectionView];
    
  
}

-(void)setCollectionView{
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing=0;
    flowLayout.minimumInteritemSpacing=0;
    flowLayout.itemSize = CGSizeMake(SCreenW/5, SCreenW/5+10);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
     CGRect frame=frame=CGRectMake(0, 64,SCreenW , SCreenH-64-49);
    self.collectionV = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    self.collectionV.delegate=self;
    self.collectionV.dataSource=self;
    [self.collectionV registerClass:[XSCGoodsGridCell class] forCellWithReuseIdentifier:XSCGoodsGridCellID];
    
    
    [self.collectionV registerClass:[XSCGoodsCountDownCell class] forCellWithReuseIdentifier:XSCGoodsCountDownCellID];
    [self.view addSubview:self.collectionV];
    
    self.view.backgroundColor=Full_BackColor;
    self.collectionV.backgroundColor=self.view.backgroundColor;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
}


#pragma mark---CollectionViewDalegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return self.grisaArray.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridCell=nil;
    if (indexPath.section==0) {
        XSCGoodsGridCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsGridCellID forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[XSCGoodsGridCell alloc]init];
        }
        cell.backgroundColor=[UIColor greenColor];
        gridCell=cell;
    }
    
    return gridCell;
}

#pragma mark - item宽高
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        return CGSizeMake(SCreenW/5, SCreenW/5+10);
//    }
//    return CGSizeZero;
//}
@end
