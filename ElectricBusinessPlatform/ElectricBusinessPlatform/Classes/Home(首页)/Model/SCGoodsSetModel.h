//
//  SCGoodsSetModel.h
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/9.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCGoodsSetModel : NSObject
@property(nonatomic,strong)NSArray *images;
@property(nonatomic,copy)NSString *goods_address;
@property(nonatomic,copy)NSString *sale_count;
@property(nonatomic,copy)NSString *expressage;
@property(nonatomic,copy)NSString *goods_title;
@property(nonatomic,copy)NSString *image_url;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *sales;
@property(nonatomic,copy)NSString *main_title;
@property(nonatomic,copy)NSString *stock;

@end
