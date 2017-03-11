//
//  NewsLayoutList.m
//  QingpuNews
//
//  Created by 陶博 on 2017/2/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "NewsLayoutList.h"

@implementation NewsLayoutList
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.listId = dic[@"listId"];
        self.listName = dic[@"listName"];
        self.listOrder = dic[@"listOrder"];
        self.listPdfUrl = dic[@"listPdfUrl"];
        self.listImageUrl = dic[@"listImageUrl"];
    }
    return self;
}

@end
