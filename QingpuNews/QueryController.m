//
//  QueryController.m
//  QingpuNews
//
//  Created by rongyun on 17/1/6.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "QueryController.h"
#import "NewsLayoutList.h"

@interface QueryController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QueryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"版面列表";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavigationBar];
    [self initUI];
    
}
#pragma mark--配置导航栏
- (void)initNavigationBar{
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
}
#pragma mark--配置UI
- (void)initUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.layoutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *inditifier = @"indentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:inditifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inditifier];
    }
    NewsLayoutList * news = self.layoutArr[indexPath.row];
    cell.textLabel.text = news.listName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsLayoutList * news = self.layoutArr[indexPath.row];
    NSString * str = news.listId;
    if ([_delegate respondsToSelector:@selector(getLayoutLiatID:)]) {
        [_delegate getLayoutLiatID:str];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end
