//
//  MainNews.m
//  QingpuNews
//
//  Created by rongyun on 17/1/6.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "MainNews.h"

@implementation MainNews

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.pageId = dic[@"pageId"];
        self.pageDate = dic[@"pageDate"];
        self.pageNumber = dic[@"pageNumber"];
    }
    return self;
}

@end
