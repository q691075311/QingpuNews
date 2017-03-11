//
//  MainViewController.m
//  QingpuNews
//
//  Created by rongyun on 17/1/5.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "MainViewController.h"
#import "XRCarouselView.h"
#import "QueryController.h"
#import "MainNews.h"
#import "MainCell.h"
#import "DetailsController.h"
#import "CalendarController.h"
#import "NewsLayoutList.h"
#import "NewsMainList.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,CalendarDelegate,QueryDelegate>
@property (weak, nonatomic) IBOutlet XRCarouselView *XRCarouselView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headView;//表头
@property (strong, nonatomic) NSMutableArray * conentArr;//界面内容数组
@property (strong ,nonatomic) NSMutableArray * LayoutList;//版面列表
@property (strong ,nonatomic) NSMutableArray * MainNewsList;//首页新闻列表

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
    [self configNavigation];
    [self sendRequst];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
//配置导航栏
- (void)configNavigation{
    self.title = @"报纸列表";
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
}
/**
 *  发送获取首页信息的请求
 */
- (void)sendRequst{
    [SVProgressHUD show];
//    __weak UITableView * tableView = self.tableView;
    //获取报纸ID
    [NetWorkTool getMainNewsDtaWithURL:MAINURL_NEW WithSuccessBlock:^(NSArray *arr) {
        [_conentArr removeAllObjects];
        for (NSDictionary * dic in arr) {
            MainNews * news = [[MainNews alloc] initWithDic:dic];
            //非NSnull判断
            if ([news.pageNumber isKindOfClass:[NSNull class]]){
                news.pageNumber = @"";
            }
            [_conentArr addObject:news];
        }
        if (_conentArr.count != 0) {
            MainNews * news = _conentArr[1];
            NSString * str = news.pageId;
            [self getLayoutListRequestWithID:(NSString *)str];
        }else{
            
        }
    } WithfailureBlock:^(NSError * error) {
        
    }];
}
//根据报纸ID获取版面列表
- (void)getLayoutListRequestWithID:(NSString *)str{
    [NetWorkTool getMainNewsDtaWithURL:[NSString stringWithFormat:@"%@?pageId=%@",MAINURL_LIST,str]
                      WithSuccessBlock:^(NSArray *arr) {
                          [_LayoutList removeAllObjects];
                          for (NSDictionary * dic in arr) {
                              NewsLayoutList * news = [[NewsLayoutList alloc]initWithDic:dic];
                              [_LayoutList addObject:news];
                          }
                          if (_LayoutList.count !=0) {
                              NewsLayoutList * news = _LayoutList[1];
                              [self getNewsListWithID:news.listId WithType:0];
                          }
                      }
                      WithfailureBlock:^(NSError *error) {
                          
                      }];
}
//根据版面ID或者新闻ID获取新闻列表
- (void)getNewsListWithID:(NSString *)ID WithType:(int)type{
    __weak UITableView * tableView = self.tableView;
    NSString * url;
    if (type == 0) {
        //默认URL
        url = [NSString stringWithFormat:@"%@?listId=%@",MAINURL_DETAILS,ID];
    }else if (type == 1){
        //报纸ID
        url = [NSString stringWithFormat:@"%@?pageId=%@",MAINURL_DETAILS,ID];
    }
    [NetWorkTool getMainNewsDtaWithURL:url WithSuccessBlock:^(NSArray *arr) {
            [_MainNewsList removeAllObjects];
            for (NSDictionary * dic in arr) {
                NewsMainList * news = [[NewsMainList alloc]initWithDic:dic];
                //非NSnull判断
                if ([news.articleAuthor isKindOfClass:[NSNull class]]){
                    news.articleAuthor = @"";
                }
                [_MainNewsList addObject:news];
            
            }
        if (_MainNewsList && _MainNewsList.count>2) {
            NSArray * ADArr = @[_MainNewsList[0],_MainNewsList[1],_MainNewsList[2]];
            [self initXRCarouselViewWithImageArr:ADArr];
        }
        [tableView reloadData];
        [SVProgressHUD dismiss];
    }
                      WithfailureBlock:^(NSError *error) {
                          
                      }];
}

/**
 *  初始化界面UI
 */
- (void)initUI{
    //初始化数组
    _MainNewsList = [[NSMutableArray alloc] init];
    _LayoutList = [[NSMutableArray alloc] init];
    _conentArr = [[NSMutableArray alloc] init];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableHeaderView = _headView;
//    [self initNavigationItem];
//    [self initXRCarouselView];
}
/**
 *  初始化广告页
 */
- (void)initXRCarouselViewWithImageArr:(NSArray *)arr{
    NSMutableArray * imageArr = [[NSMutableArray alloc] init];
    for (NewsMainList * news in arr) {
        [imageArr addObject:news.articleImage];
    }
    _XRCarouselView.imageArray = imageArr;
    _XRCarouselView.time = 2;
    _XRCarouselView.changeMode = ChangeModeDefault;
    _XRCarouselView.imageClickBlock = ^(NSInteger index){
        NewsMainList * news = arr[index];
        UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DetailsController * detailsVC = [sb instantiateViewControllerWithIdentifier:@"DetailsController"];
        detailsVC.news = news;
        [self.navigationController pushViewController:detailsVC animated:YES];
    };
}
//期刊排行(时间)
- (IBAction)lieftBtn:(UIButton *)sender {
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CalendarController * vc = [sb instantiateViewControllerWithIdentifier:@"CalendarController"];
    vc.delegate = self;
    vc.mainNews = _conentArr;
    [self.navigationController pushViewController:vc animated:YES];
}
//版面列表
- (IBAction)rigthBtn:(UIButton *)sender {
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QueryController * vc = [sb instantiateViewControllerWithIdentifier:@"QueryController"];
    vc.delegate = self;
    vc.layoutArr = _LayoutList;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark--QueryDelegate
- (void)getLayoutLiatID:(NSString *)ID{
    //版面id
    [SVProgressHUD show];
    [self getNewsListWithID:ID WithType:0];
    NSLog(@"%@",ID);
}

#pragma mark--CalendarDelegate
- (void)getPageDataFromCalendarWith:(NSString *)data{
    //报纸ID
    [SVProgressHUD show];
    [self getNewsListWithID:data WithType:1];
    NSLog(@"%@",data);
}

#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _MainNewsList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    NewsMainList * new = _MainNewsList[indexPath.row];
    cell.newsModel = new;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsMainList * new = _MainNewsList[indexPath.row];
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailsController * detailsVC = [sb instantiateViewControllerWithIdentifier:@"DetailsController"];
    detailsVC.news = new;
    [self.navigationController pushViewController:detailsVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
