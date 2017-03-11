//
//  MainNews.h
//  QingpuNews
//
//  Created by rongyun on 17/1/6.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainNews : NSObject
/**
 *  报纸的ID
 */
@property (nonatomic,copy) NSString * pageId;
/**
 *  期刊号
 */
@property (nonatomic,copy) NSString * pageNumber;
/**
 *  发布时间
 */
@property (nonatomic,copy) NSString * pageDate;
/**
 *  新闻评论数量
 */
//@property (nonatomic,copy) NSString * newsComment;
/**
 *  新闻图片
 */
//@property (nonatomic,copy) NSString * newsImage;

- (instancetype)initWithDic:(NSDictionary *)dic;
@end
