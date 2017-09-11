//
//  UIBarButtonItem+SCBarButtonItem.h
//  ElectricBusinessPlatform
//
//  Created by ghrui on 2017/9/8.
//  Copyright © 2017年 XieShichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SCBarButtonItem)
+(UIBarButtonItem*)ItemWithImage:(NSString*)image withHightedImage:(NSString*)hightImage Target:(id)target Action:(SEL)action;
@end
