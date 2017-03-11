//
//  DetailsController.m
//  QingpuNews
//
//  Created by rongyun on 17/1/10.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "DetailsController.h"

@interface DetailsController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *dataBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commentsBar;

@end

@implementation DetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.news);
    [self setUI];
    
}
#pragma mark--设置UI界面

- (void)setUI{
    self.title = @"新闻详情";
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor redColor]};
    _dataBar.title = _news.articleDate;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //新闻详情的图片
    UIImageView * imageView = [[UIImageView alloc] init];
    
    if (self.news.articleImage) {
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.news.articleImage] placeholderImage:[UIImage imageNamed:@"XRPlaceholder"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //新闻的图片
            if (image) {
                //有图片
                float calse = image.size.width/DWIGTH;
                CGFloat H = image.size.height/calse;
                imageView.frame = CGRectMake(0, 0, DWIGTH, H);
                [self loadLableWith:imageView];
            }else{
                //没有图片
                imageView.frame = CGRectZero;
                [self loadLableWith:imageView];
            }
        }];
    }else{
        imageView.frame = CGRectZero;
        [self loadLableWith:imageView];
    }
    
    
}

- (void)loadLableWith:(UIImageView *)imageView{
    //新闻详情的lable
    UILabel * lable = [[UILabel alloc]init];
    lable.text = self.news.articleContent;
    lable.numberOfLines = 0;
    lable.font = [UIFont systemFontOfSize:14];
    CGRect rect = [lable.text boundingRectWithSize:CGSizeMake(DWIGTH - 16, MAXFLOAT)
                                           options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    lable.frame = CGRectMake(8, imageView.bounds.size.height+5, DWIGTH-16, rect.size.height);
    _scrollView.contentSize = CGSizeMake(DWIGTH, imageView.bounds.size.height + rect.size.height+10);
    [_scrollView addSubview:lable];
    [_scrollView addSubview:imageView];
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
