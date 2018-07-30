//
//  ViewController.m
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import "ViewController.h"

#import "noHeaderTableViewCell.h"
#import "headerTableViewCell.h"
#import "MoreSectionTableViewCell.h"

#import "DeadlineModel.h"
#import "SelectView.h"
#import "SelectTypeView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, SelectViewDelegate> {
    NSInteger sectionNumber;
}

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableArray *moreDataArray;


@property (nonatomic, strong) SelectTypeView *selectView;

@property (nonatomic, strong) SelectView *headerSelectView;
@end

@implementation ViewController


- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        for (int i = 0; i < 10; i++) {
            DeadlineModel *model = [[DeadlineModel alloc] init];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (NSMutableArray *)moreDataArray {
    if (_moreDataArray == nil) {
        _moreDataArray = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            DeadlineModel *model = [[DeadlineModel alloc] init];
            [_moreDataArray addObject:model];
        }
    }
    return _moreDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSubView];
}

- (void)setSubView {
    sectionNumber = 1;
    
    
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerNib:[UINib nibWithNibName:@"noHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"noHeaderTableViewCell"];
    
    [_myTableView registerNib:[UINib nibWithNibName:@"headerTableViewCell" bundle:nil] forCellReuseIdentifier:@"headerTableViewCell"];
    
    [self headerView];
}

- (void)headerView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 68 + 15)];
    
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(18, 5 + 15, [[UIScreen mainScreen] bounds].size.width - 18 * 2, 68 - 5 * 2)];
    backImage.image = [UIImage imageNamed:@"banner_beginners_bg"];
    [headerView addSubview:backImage];
    
    _myTableView.tableHeaderView = headerView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 68 + 15 - 20) {
        _headerSelectView.backgroundColor = [UIColor redColor];
    } else {
        _headerSelectView.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (sectionNumber == 1) {
        return self.dataArray.count;
    } else {
        return 4;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (sectionNumber == 1) {
        DeadlineModel *model = self.dataArray[indexPath.row];
        if (model.type == TYPE_KEEP) {
           headerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerTableViewCell"];
            cell.txtArray = @[@"资管计划", @"添金喜18057"];
            return cell;
        } else {
            noHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noHeaderTableViewCell"];
            cell.txtArray = @[@"结构性存款", @"添金喜18057"];
            return cell;
        }
    } else {
//        NSString *identifier = @"MoreSectionTableViewCell";
//        MoreSectionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        if (cell == nil) {
            MoreSectionTableViewCell *  cell = [[MoreSectionTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MoreSectionTableViewCell"];
//        }
        cell.dataArray = self.moreDataArray;
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (sectionNumber == 1) {
        DeadlineModel *model = self.dataArray[indexPath.row];
        return model.height;
    } else {
        NSInteger height = 59;
        for (int i = 0; i < self.moreDataArray.count; i++) {
            DeadlineModel *model = self.moreDataArray[i];
            height = height + model.height;
        }
        return height;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 51 + 15;

}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    _headerSelectView = [[SelectView alloc] initWithFrame:CGRectMake(0, 5, [[UIScreen mainScreen] bounds].size.width, 51 + 15)];
    _headerSelectView.delegate = self;
    return _headerSelectView;
}

#pragma mark - SelectViewDelegate
- (void)selectView:(SelectView *)view type:(SELECT_TYPE)type {
    if (type == SELECT_SELECT) {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[view convertRect: view.bounds toView:window];
        self.selectView.aframe = rect;
        self.selectView.getClickType = ^(NSDictionary *data) {
            NSLog(@"getClickType ==== %@", data);
        };
        [self.selectView show];
    }
    if (type == SELECT_DATEBTN) {
        NSInteger result = sectionNumber > 1 ? 1:4;
        sectionNumber = result;
        [_myTableView reloadData];
    }
}

- (SelectTypeView *)selectView {
    if (_selectView == nil) {
         _selectView  = [[SelectTypeView alloc] initWithProArray:@[@"全部类型", @"银行理财", @"银行理财", @"结构性存款"] moneyArray:@[@"全部金额", @"5万以下", @"5万以下", @"5万"]];
    }
    return _selectView;
}


@end
