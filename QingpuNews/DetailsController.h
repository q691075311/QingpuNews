//
//  DetailsController.h
//  QingpuNews
//
//  Created by rongyun on 17/1/10.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsMainList.h"

@interface DetailsController : UIViewController
/**
 *  接收首页传的新闻列表modle
 */
@property (nonatomic,strong) NewsMainList * news;

@end
