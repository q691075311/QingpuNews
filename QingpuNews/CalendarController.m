//
//  CalendarController.m
//  QingpuNews
//
//  Created by rongyun on 17/1/13.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "CalendarController.h"
#import "SZCalendarPicker.h"
#import "MainNews.h"

@interface CalendarController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CalendarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@",self.pageDataArr);
    self.title = @"期刊排行";
    [self configNavigation];
    [self initUI];
//    [self loadCalendar];
}
//配置导航栏
- (void)configNavigation{
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
}
//配置UI
- (void)initUI{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mainNews.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * inditifier = @"data";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:inditifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inditifier];
    }
    MainNews * news = self.mainNews[indexPath.row];
    cell.textLabel.text = news.pageDate;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MainNews * news = self.mainNews[indexPath.row];
    NSString * ID = news.pageId;
    if ([_delegate respondsToSelector:@selector(getPageDataFromCalendarWith:)]) {
        [_delegate getPageDataFromCalendarWith:ID];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

//加载日历
- (void)loadCalendar{
    SZCalendarPicker * picker = [SZCalendarPicker showOnView:self.view];
    picker.frame = CGRectMake(0, 64, DWIGTH, 300);
    picker.today = [NSDate date];
    picker.date = picker.today;
    picker.calendarBlock = ^(NSInteger day,NSInteger month,NSInteger year){
        NSLog(@"%li-%li-%li", (long)year,(long)month,(long)day);
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
