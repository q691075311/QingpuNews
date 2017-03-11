//
//  CalendarController.h
//  QingpuNews
//
//  Created by rongyun on 17/1/13.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalendarDelegate <NSObject>
/**
 *  传入的期刊日期
 */
- (void)getPageDataFromCalendarWith:(NSString *)data;

@end

@interface CalendarController : UIViewController
/**
 *  接受首页传的期刊数组
 */
@property (nonatomic, strong) NSArray * mainNews;
@property (assign, nonatomic) id<CalendarDelegate> delegate;
@end
