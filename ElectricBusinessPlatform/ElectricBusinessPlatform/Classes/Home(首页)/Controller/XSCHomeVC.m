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
#import "XSCGoodsSectionTwoCell.h"
#import "XSCGoodsSectionThirdCell.h"
#import "XSCGoodsSectionFourthCell.h"

#import "XSCSlidesHeadView.h"
#import "XSCCountDownheadView.h"
#import "SCGoodsTagHeadView.h"

#import "XSCSlidesFooterView.h"
#import "SCScrollAdFootView.h"
#import "SCPromptingFooterView.h"

#import "GTCollectionViewFlowLayout.h"
#import "XSCGoodsGridsModel.h"
#import "XSCRecommendModel.h"
static NSString *const XSCGoodsGridCellID=@"XSCGoodsGridCell";
static NSString *const XSCGoodsCountDownCellID=@"XSCGoodsCountDownCell";
static NSString *const XSCGoodsSectionTwoCellID=@"XSCGoodsSectionTwoCell";
static NSString *const XSCGoodsSectionThirdCellID=@"XSCGoodsSectionThirdCell";
static NSString *const XSCGoodsSectionFourthCellID=@"XSCGoodsSectionFourthCell";

static NSString *const XSCSlidesHeadViewID=@"XSCSlidesHeadView";
static NSString *const XSCCountDownheadViewID=@"XSCCountDownheadView";
static NSString *const SCGoodsTagHeadViewID=@"SCGoodsTagHeadView";

static NSString *const XSCSlidesFooterViewID=@"XSCSlidesFooterView";
static NSString *const SCScrollAdFootViewID=@"SCScrollAdFootView";
static NSString *const SCPromptingFooterViewID=@"SCPromptingFooterView";
@interface XSCHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionV;
@property(nonatomic,strong)GTCollectionViewFlowLayout *flowLayout;
// 10个商品属性;

@property(nonatomic,strong)NSMutableArray *grisaArray;
// 推荐商品
@property(nonatomic,strong)NSMutableArray *youLikeItems;
@end

@implementation XSCHomeVC


-(NSMutableArray*)grisaArray{
    if (_grisaArray==nil) {
        _grisaArray=[XSCGoodsGridsModel mj_objectArrayWithFilename:@"GoodsGrid.plist"];
    }
    return _grisaArray;
}

-(NSMutableArray*)youLikeItems{
    if (_youLikeItems==nil) {
        _youLikeItems=[XSCRecommendModel mj_objectArrayWithFilename:@"HomeHighGoods.plist"];
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
//    flowLayout.itemSize = CGSizeMake(SCreenW/5, SCreenW/5+10);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
     CGRect frame=frame=CGRectMake(0, 64,SCreenW , SCreenH-64-49);
    self.collectionV = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    self.collectionV.delegate=self;
    self.collectionV.dataSource=self;
    
    [self.collectionV registerClass:[XSCGoodsGridCell class] forCellWithReuseIdentifier:XSCGoodsGridCellID];
    
    
    [self.collectionV registerClass:[XSCGoodsCountDownCell class] forCellWithReuseIdentifier:XSCGoodsCountDownCellID];
    
    [self.collectionV registerClass:[XSCGoodsSectionTwoCell class] forCellWithReuseIdentifier:XSCGoodsSectionTwoCellID];
    
    [self.collectionV registerClass:[XSCGoodsSectionThirdCell class] forCellWithReuseIdentifier:XSCGoodsSectionThirdCellID];
    
    [self.collectionV registerClass:[XSCGoodsSectionFourthCell class] forCellWithReuseIdentifier:XSCGoodsSectionFourthCellID];
    
    [self.collectionV registerClass:[XSCSlidesHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XSCSlidesHeadViewID];
    
    [self.collectionV registerClass:[XSCCountDownheadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XSCCountDownheadViewID];
    
    [self.collectionV registerClass:[SCGoodsTagHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SCGoodsTagHeadViewID];
    
    [self.collectionV registerClass:[XSCSlidesFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:XSCSlidesFooterViewID];
    
    [self.collectionV registerClass:[SCScrollAdFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SCScrollAdFootViewID];
    
    [self.collectionV registerClass:[SCPromptingFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SCPromptingFooterViewID];
    
    [self.view addSubview:self.collectionV];
    
    self.view.backgroundColor=Full_BackColor;
    self.collectionV.backgroundColor=self.view.backgroundColor;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
}


#pragma mark---CollectionViewDalegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        NSLog(@"%zd",self.grisaArray.count);
        return self.grisaArray.count;
        
    }else if (section==1){
        return 1;
    }else if (section==2){
        return 1;
    }else if (section==3){
          NSLog(@"GoodsHandheldImagesArray--%zd",GoodsHandheldImagesArray.count);
        return GoodsHandheldImagesArray.count;
    }else if (section==4){
        return self.youLikeItems.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridCell=nil;
    if (indexPath.section==0) {
        XSCGoodsGridCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsGridCellID forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[XSCGoodsGridCell alloc]init];
        }
        cell.model=self.grisaArray[indexPath.row];
        cell.backgroundColor=[UIColor whiteColor];
        gridCell=cell;
    }else if(indexPath.section==1){
        XSCGoodsCountDownCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsCountDownCellID forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[XSCGoodsCountDownCell alloc]init];
        }
        
        cell.backgroundColor=[UIColor whiteColor];
        gridCell=cell;

    }else if (indexPath.section==2)
    {// 掌上专享商品p;
        XSCGoodsSectionTwoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsSectionTwoCellID forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[XSCGoodsSectionTwoCell alloc]init];
        }
        cell.handleImageS=GoodsRecommendArray;
        cell.backgroundColor=[UIColor whiteColor];
        gridCell=cell;
      
    }else if (indexPath.section==3){// 推荐
        XSCGoodsSectionThirdCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsSectionThirdCellID forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[XSCGoodsSectionThirdCell alloc]init];
        }
        
        cell.backgroundColor=[UIColor whiteColor];
        NSArray *images=GoodsHandheldImagesArray;
        cell.imageStr=images[indexPath.row];
        gridCell=cell;
    }else if (indexPath.section==4){
        XSCGoodsSectionFourthCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:XSCGoodsSectionFourthCellID forIndexPath:indexPath];
        if (cell==nil) {
            cell=[[XSCGoodsSectionFourthCell alloc]init];
        }
        
        cell.backgroundColor=[UIColor greenColor];
        cell.model=self.youLikeItems[indexPath.row];
        
        gridCell=cell;

    }
    return gridCell;
}
#pragma mark---header----footerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview=nil;
    if (kind==UICollectionElementKindSectionHeader) {
        if (indexPath.section==0) {
              XSCSlidesHeadView *XSreusableView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XSCSlidesHeadViewID forIndexPath:indexPath];
            reusableview=XSreusableView;
        }else if (indexPath.section==1){
            XSCCountDownheadView *countdownHeadV=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XSCCountDownheadViewID forIndexPath:indexPath];
            reusableview=countdownHeadV;
        }if (indexPath.section==3) {
            SCGoodsTagHeadView *tagHeadV=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SCGoodsTagHeadViewID forIndexPath:indexPath];
            [tagHeadV.TagBtn setTitle:@"品牌精选" forState:UIControlStateNormal];
            [tagHeadV.TagBtn setImage:[UIImage imageNamed:@"shouye_icon03"] forState:UIControlStateNormal];
            [tagHeadV.TagBtn setTitleColor:RGB(82, 172, 25) forState:UIControlStateNormal];
            
            reusableview=tagHeadV;
        }else if (indexPath.section==4){
            SCGoodsTagHeadView *tagHeadV=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SCGoodsTagHeadViewID forIndexPath:indexPath];
            [tagHeadV.TagBtn setTitle:@"热门推荐" forState:UIControlStateNormal];
            [tagHeadV.TagBtn setImage:[UIImage imageNamed:@"shouye_icon02"] forState:UIControlStateNormal];
            [tagHeadV.TagBtn setTitleColor:RGB(52, 143, 243) forState:UIControlStateNormal];
            
            reusableview=tagHeadV;
        }
      
        
    }else if (kind==UICollectionElementKindSectionFooter){
        if (indexPath.section==0) {
            XSCSlidesFooterView *slidesFooterV=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:XSCSlidesFooterViewID forIndexPath:indexPath];
            reusableview=slidesFooterV;
        }else if (indexPath.section==2){
            SCScrollAdFootView *adFootV=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SCScrollAdFootViewID forIndexPath:indexPath];
            reusableview=adFootV;
        }else if (indexPath.section==4){
            SCPromptingFooterView *promptFootV=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SCPromptingFooterViewID forIndexPath:indexPath];
            reusableview=promptFootV;
        }
        
    }
    
    return reusableview;
}
#pragma mark - item --cell---宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(SCreenW/5, SCreenW/5+10);
    }else if (indexPath.section==1){
        return CGSizeMake(SCreenW, 150);
    }else if (indexPath.section==2){
        return CGSizeMake(SCreenW, SCreenH*0.35+120);
    }else if (indexPath.section==3){
       return  [self layoutAttributesForItemAtIndexPath:indexPath].size;
    }else if (indexPath.section==4){
        return CGSizeMake((SCreenW-4)/2, (SCreenW-4)/2+40);
    }
    return CGSizeZero;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section==3) {
        
        if (indexPath.row==0) {
            
            attributes.size=CGSizeMake(SCreenW,SCreenW*0.35);
            
        }else if(indexPath.row==1 || indexPath.row==2 || indexPath.row==3 || indexPath.row==4){
            
            attributes.size=CGSizeMake(SCreenW*0.5, SCreenW*0.2);
            
        }else{
            
            attributes.size=CGSizeMake(SCreenW*0.25, SCreenW*0.35);
        }
    }
    return attributes;
}

#pragma mark----header--footer 高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(SCreenW, 150);
    }else if (section==1 || section==3 || section==4){
        return CGSizeMake(SCreenW, 40);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(SCreenW, 60);
    }else if (section==2){
        return CGSizeMake(SCreenW, 80);
    }else if (section==4){
        return CGSizeMake(SCreenW,40);
    }
   
    return CGSizeZero;
}
@end
