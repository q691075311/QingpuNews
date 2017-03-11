//
//  MainViewController.h
//  QingpuNews
//
//  Created by rongyun on 17/1/5.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
/**
 * 需要获取的期刊时间
 */
@property (nonatomic, copy) NSString * pageData;

@property (nonatomic, assign) int fromType;
@end

