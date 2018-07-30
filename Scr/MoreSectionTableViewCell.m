//
//  MoreSectionTableViewCell.m
//  Scr
//
//  Created by 万浩 on 2018/7/4.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import "MoreSectionTableViewCell.h"
#import "DeadlineModel.h"
#import "headerTableViewCell.h"
#import "noHeaderTableViewCell.h"
#define selfWidth     self.frame.size.width

#define selfHeight    self.frame.size.height


@interface MoreSectionTableViewCell()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;


@end

@implementation MoreSectionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubView];
    }
    return self;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    for (int i = 0; i < dataArray.count; i++) {
        DeadlineModel *model = dataArray[i];
        self.cellHeight = model.height + self.cellHeight;
        NSLog(@"model.height  === %ld", model.height);
    }
    _myTableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.cellHeight + 59);
}

- (void)setSubView {
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.cellHeight) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.scrollEnabled = NO;
    [self addSubview:_myTableView];
    
    
    [_myTableView registerNib:[UINib nibWithNibName:@"noHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"noHeaderTableViewCell"];
    
    [_myTableView registerNib:[UINib nibWithNibName:@"headerTableViewCell" bundle:nil] forCellReuseIdentifier:@"headerTableViewCell"];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DeadlineModel *model = self.dataArray[indexPath.row];
//    UITableViewCell *cell;
    if (model.type == TYPE_KEEP) {
        headerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerTableViewCell"];
        return cell;

    } else {
       noHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noHeaderTableViewCell"];
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DeadlineModel *model = self.dataArray[indexPath.row];
    return model.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 59;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 59)];
    UIImageView *imageVI = [[UIImageView alloc] initWithFrame:CGRectMake(26, 59 - 17 - 5, 19, 17)];
    imageVI.image = [UIImage imageNamed:@"calendar"];
    [headerView addSubview:imageVI];
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageVI.frame) + 5, CGRectGetMinY(imageVI.frame) - 8.5, [[UIScreen mainScreen] bounds].size.width - CGRectGetMaxX(imageVI.frame), 34)];
    titleLable.text = @"1~4月";
    titleLable.font = [UIFont systemFontOfSize:18.0f];
    [headerView addSubview:titleLable];
    return headerView;
}


@end
