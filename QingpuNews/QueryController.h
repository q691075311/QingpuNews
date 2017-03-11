//
//  QueryController.h
//  QingpuNews
//
//  Created by rongyun on 17/1/6.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QueryDelegate <NSObject>

- (void)getLayoutLiatID:(NSString *)ID;

@end
@interface QueryController : UIViewController
/**
 *  接收首页传的版面列表
 */
@property (nonatomic , copy) NSArray * layoutArr;
@property (nonatomic ,assign) id<QueryDelegate> delegate;
@end
