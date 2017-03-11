//
//  NewsMainList.m
//  QingpuNews
//
//  Created by 陶博 on 2017/2/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "NewsMainList.h"

@implementation NewsMainList
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.articleId = dic[@"articleId"];
        self.articleDate = dic[@"articleDate"];
        self.articleDesc = dic[@"articleDesc"];
        self.articleImage = dic[@"articleImage"];
        self.articleTitle = dic[@"articleTitle"];
        self.articleAuthor = dic[@"articleAuthor"];
        self.articleContent = dic[@"articleContent"];
    }
    return self;
}

@end
