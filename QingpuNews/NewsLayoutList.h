//
//  NewsLayoutList.h
//  QingpuNews
//
//  Created by 陶博 on 2017/2/12.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsLayoutList : NSObject
/**
 *  版面ID
 */
@property (nonatomic ,copy) NSString *listId;
/**
 *  版面名称
 */
@property (nonatomic ,copy) NSString *listName;
/**
 *  版面排序
 */
@property (nonatomic ,copy) NSString *listOrder;
/**
 *  版面图片路径
 */
@property (nonatomic ,copy) NSString *listImageUrl;
/**
 *  版面电子文件路径
 */
@property (nonatomic ,copy) NSString *listPdfUrl;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
