//
//  NewsMainList.h
//  QingpuNews
//
//  Created by 陶博 on 2017/2/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsMainList : NSObject
/**
 *  文章作者
 */
@property (nonatomic,copy) NSString *articleAuthor;
/**
 *  文章内容
 */
@property (nonatomic,copy) NSString *articleContent;
/**
 *  发布时间
 */
@property (nonatomic,copy) NSString *articleDate;
/**
 *  简单描述
 */
@property (nonatomic,copy) NSString *articleDesc;
/**
 *  新闻ID
 */
@property (nonatomic,copy) NSString *articleId;
/**
 *  图片路径(为空表示无内嵌图片)
 */
@property (nonatomic,copy) NSString *articleImage;
/**
 *  文章标题
 */
@property (nonatomic,copy) NSString *articleTitle;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
