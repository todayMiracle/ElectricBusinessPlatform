//
//  SCGoodsSetVC.m
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/9.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import "SCGoodsSetVC.h"
#import "SCNarSearchbarView.h"
#import "SCGoodsSetCell.h"
#import "SCGoodsSetTwoCell.h"
#import "SCGoodsSetModel.h"
#import "SCGoodsTagHeadView.h"
#import "SCRightImglefttitleBtn.h"

@interface SCGoodsSetVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UIButton *switchBtn;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIButton *backTopBtn;
@property(nonatomic,strong)UIButton *footerPrintbtn;// 足迹
@property(nonatomic,assign)BOOL switchIsTwo;
@property(nonatomic,assign)CGFloat lastContentOffset;
@property(nonatomic,strong)UIWebView *webView;
@property(nonatomic,strong)UIScrollView *scrollview;
@end

static NSString *const SCGoodsSetCellID=@"SCGoodsSetCell";
static NSString *const SCGoodsSetTwoCellID=@"SCGoodsSetTwoCell";
static NSString *const SCGoodsTagHeadViewID=@"SCGoodsTagHeadView";
@implementation SCGoodsSetVC

-(NSMutableArray*)dataArray{
    if (_dataArray==nil) {
        NSArray *array=[SCGoodsSetModel mj_objectArrayWithFilename:@"ClasiftyGoods.plist"];
        _dataArray=[NSMutableArray arrayWithArray:array];
        
    }
    return _dataArray;
}
-(UIScrollView*)scrollview{
    if (_scrollview==nil) {
        _scrollview=[[UIScrollView alloc]init];
        _scrollview.frame=self.view.bounds;
        _scrollview.contentSize=CGSizeMake(SCreenW, SCreenH*2);
        _scrollview.pagingEnabled=YES;
        _scrollview.scrollEnabled=NO;
        
        [self.view addSubview:_scrollview];
    }
    return _scrollview;
}

-(UIWebView*)webView{
    if (_webView==nil) {
        _webView=[[UIWebView alloc]init];
        _webView.frame=CGRectMake(0,SCreenH, SCreenW, SCreenH);
        _webView.scrollView.contentInset=UIEdgeInsetsMake(60, 0, 0, 0);
        _webView.scrollView.scrollIndicatorInsets=_webView.scrollView.contentInset;
        [self.scrollview addSubview:_webView];
        
    }
    return _webView;
}

-(UICollectionView*)collectionView{
    if (_collectionView==nil) {
        UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
        flowlayout.minimumLineSpacing=0;
        flowlayout.minimumInteritemSpacing=0;
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        CGRect frame=CGRectMake(0, 0, SCreenW, SCreenH);
        _collectionView=[[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowlayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        
        [_collectionView registerClass:[SCGoodsSetCell class] forCellWithReuseIdentifier:SCGoodsSetCellID];
        
        [_collectionView registerClass:[SCGoodsSetTwoCell class] forCellWithReuseIdentifier:SCGoodsSetTwoCellID];
        
        [_collectionView registerClass:[SCGoodsTagHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SCGoodsTagHeadViewID];
        
        
    }
    return _collectionView;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor=Full_BackColor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.switchIsTwo=NO;
    self.view.backgroundColor=Full_BackColor;
    [self setNavigationBar];
    
    // 上拉看详情;
    
    self.scrollview.backgroundColor=Full_BackColor;
    [self.scrollview addSubview:self.collectionView];
    self.collectionView.backgroundColor=Full_BackColor;
    
    [self setupSuspendView];
    
    // 设置视图滚动；
    [self setScrollviewToScroll];
    
    // 设置上拉详情；
    [self setUpGoodsWebview];
    
    
}
-(void)setScrollviewToScroll
{
    __weak typeof(self)Weakself=self;
    self.collectionView.mj_footer=[MJRefreshBackFooter footerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            Weakself.scrollview.contentOffset=CGPointMake(0, SCreenH);
            
        } completion:^(BOOL finished) {
            [Weakself.collectionView.mj_footer endRefreshing];
        }];
    }];
    
    self.webView.scrollView.mj_header=[MJRefreshHeader headerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            Weakself.scrollview.contentOffset=CGPointMake(0, 0);
            
        } completion:^(BOOL finished) {
            [Weakself.webView.scrollView.mj_header endRefreshing];
        }];
        
    }];
}
-(void)setUpGoodsWebview
{
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://weibo.com/u/5605532343"]];
    [self.webView loadRequest:request];
    
    // 设置下拉回到商品列表；
    UIView *topview=[[UIView alloc]init];
    topview.backgroundColor=Full_BackColor;
    topview.frame=CGRectMake(0, -35, SCreenW, 35);
    
    SCRightImglefttitleBtn *btn=[SCRightImglefttitleBtn buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitle:@"下拉返回商品详情" forState:UIControlStateNormal];
    
    btn.imageView.transform=CGAffineTransformRotate(btn.imageView.transform, M_PI);
    [btn setImage:[UIImage imageNamed:@"Details_Btn_Up"] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:11];
    
    [topview addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topview.mas_centerY);
        make.centerX.equalTo(topview.mas_centerX);
        make.width.mas_equalTo(85);
    }];
    
    [self.webView.scrollView addSubview:topview];
    
}
#pragma mark---设置悬浮按钮
-(void)setupSuspendView{
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"btn_UpToTop"] forState:UIControlStateNormal];
    
    [btn1 addTarget:self action:@selector(backTopbtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    btn1.hidden=YES;
    
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view.mas_bottom).offset(-60);
        make.width.height.mas_equalTo(40);
    }];
    self.backTopBtn=btn1;
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"ptgd_icon_zuji"] forState:UIControlStateNormal];
    
    [btn2 addTarget:self action:@selector(footerPrintbtn:) forControlEvents:UIControlEventTouchUpInside];
    
    btn2.hidden=NO;
    btn2.frame=CGRectMake(SCreenW-50, SCreenH-60, 40, 40);
    [self.view addSubview:btn2];

    self.footerPrintbtn=btn2;

}
-(void)backTopbtnClick:(UIButton*)send
{
    NSLog(@"回顶部");
    
    [self.collectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}
-(void)footerPrintbtn:(UIButton*)send{
        NSLog(@"足迹");
}
-(void)setNavigationBar
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(leftNaBarclick)];
    
    UIButton *switchBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    switchBtn.imageEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    
    [switchBtn setImage:[UIImage imageNamed:@"nav_btn_jiugongge"] forState:UIControlStateNormal];
    [switchBtn setImage:[UIImage imageNamed:@"nav_btn_list"] forState:UIControlStateSelected];
    
     [switchBtn addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventTouchUpInside];
    self.switchBtn=switchBtn;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.switchBtn];
    
    
    
    
  
    
    SCNarSearchbarView *searchView=[[SCNarSearchbarView alloc]init];
    searchView.searchPlaceHoldLa.text=@"快速查找商品";
    searchView.frame=CGRectMake(0, 0, SCreenW-120, 35);
    searchView.voiceButtonClick=^{
        NSLog(@"语音搜索");
    };
    searchView.searchButtonClick=^{
        NSLog(@"搜索");

    };
    self.navigationItem.titleView=searchView;
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.switchIsTwo!=YES) {
        SCGoodsSetCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:SCGoodsSetCellID forIndexPath:indexPath];
        if (!cell) {
            cell=[[SCGoodsSetCell alloc]init];
        }
      
        cell.listModel=self.dataArray[indexPath.row];
        return cell;

    }else{
        SCGoodsSetTwoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:SCGoodsSetTwoCellID forIndexPath:indexPath];
        if (!cell) {
            cell=[[SCGoodsSetTwoCell alloc]init];
        }
     
        cell.listModel=self.dataArray[indexPath.row];
        return cell;

    }
  }

#pragma mark--cell  的宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.switchIsTwo!=YES) {
        return CGSizeMake((SCreenW-4)/2,(SCreenW-4)/2+80);
    }
    return CGSizeMake(SCreenW,120);
}
#pragma mark---footView---
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *ReusableView=nil;
    if (kind==UICollectionElementKindSectionFooter) {
        SCGoodsTagHeadView *footView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:SCGoodsTagHeadViewID forIndexPath:indexPath];
        [footView.TagBtn setTitle:@"上拉查看图文详情" forState:UIControlStateNormal];
        [footView.TagBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        footView.TagBtn.titleLabel.font=[UIFont systemFontOfSize:11];
        [footView.TagBtn setImage:[UIImage imageNamed:@"Details_Btn_Up"] forState:UIControlStateNormal];
        ReusableView=footView;
    }
    
    return ReusableView;
}
#pragma mark---footview  高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(SCreenW,40);
}
#pragma mark----滑动代理；
//开始滑动的时候记录位置
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _lastContentOffset=scrollView.contentOffset.y;
    NSLog(@"BeginDragging----%f",_lastContentOffset);
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"BeginDecelerating----%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y>_lastContentOffset) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.collectionView.frame=CGRectMake(0, 20, SCreenW, SCreenH-20);
        self.view.backgroundColor=[UIColor whiteColor];
    }else{
        [self.navigationController setNavigationBarHidden:NO animated:YES];
         self.collectionView.frame=CGRectMake(0, 0, SCreenW, SCreenH-0);
        
        self.view.backgroundColor=Full_BackColor;
    }
}

#pragma mark---<ScrollViewDelegate>

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 判断回到顶部按钮是否隐藏；
    _backTopBtn.hidden=(scrollView.contentOffset.y>SCreenH)?NO:YES;
    
    //更改足迹按钮位置;
    __weak typeof(self)Weakself=self;
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(Weakself) strongSelf=self;
        strongSelf.footerPrintbtn.y=strongSelf.backTopBtn.hidden==YES?SCreenH-60:SCreenH-110;
    }];
}
-(void)leftNaBarclick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)switchClick:(UIButton*)send
{
    send.selected=!send.selected;
    self.switchIsTwo=send.selected;
    [self.collectionView reloadData];
}

@end
