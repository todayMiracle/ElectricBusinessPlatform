//
//  GTCollectionViewFlowLayout.h
//  小表哥金融
//
//  Created by 官焘 on 2017/6/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTCollectionViewFlowLayout : UICollectionViewFlowLayout
//  一行中 cell 的个数
@property (nonatomic,assign) NSUInteger itemCountPerRow;

//    一页显示多少行
@property (nonatomic,assign) NSUInteger rowCount;
@end
