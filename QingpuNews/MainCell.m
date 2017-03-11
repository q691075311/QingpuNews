//
//  MainCell.m
//  QingpuNews
//
//  Created by rongyun on 17/1/6.
//  Copyright © 2017年 rongyun. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setNewsModel:(NewsMainList *)newsModel{
    self.newsTitle.text = newsModel.articleTitle;
    self.newsDate.text = newsModel.articleDate;
//    [self.newsImage sd_setImageWithURL:[NSURL URLWithString:newsModel.articleImage]];
    [self.newsImage sd_setImageWithURL:[NSURL URLWithString:newsModel.articleImage] placeholderImage:[UIImage imageNamed:@"XRPlaceholder"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
·