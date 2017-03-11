//
//  NetWorkTool.h
//  QingpuNews
//
//  Created by rongyun on 17/1/5.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface NetWorkTool : NSObject
/**
 *  发送请求
 *
 *  @param successBlock 成功的block
 *  @param failureBlock 失败的block
 */
+ (void)getMainNewsDtaWithURL:(NSString *)URL WithSuccessBlock:(void(^)(NSArray *arr))block WithfailureBlock:(void(^)(NSError * error))failureBlock;




@end
