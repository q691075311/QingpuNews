//
//  NetWorkTool.m
//  QingpuNews
//
//  Created by rongyun on 17/1/5.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool
//首页的请求
+ (void)getMainNewsDtaWithURL:(NSString *)URL WithSuccessBlock:(void(^)(NSArray *arr))successBlock WithfailureBlock:(void(^)(NSError * error))failureBlock{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString * url1 = [URL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager GET:url1
      parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(arr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
    
}


@end
