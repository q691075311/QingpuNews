//
//  MainCell.h
//  QingpuNews
//
//  Created by rongyun on 17/1/6.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsMainList.h"

@interface MainCell : UITableViewCell

/**
 *  新闻的ID
 */
@property (nonatomic,copy) NSString * newsID;
/**
 *  新闻标题
 */
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
/**
 *  新闻图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
/**
 *  新闻发布时间
 */
@property (weak, nonatomic) IBOutlet UILabel *newsDate;
/**
 *  新闻评论量
 */
@property (weak, nonatomic) IBOutlet UILabel *newsComment;
@property (nonatomic,strong) NewsMainList * newsModel;


@end
