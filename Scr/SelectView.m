//
//  SelectView.m
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import "SelectView.h"
#import "UIColor+otherColor.h"
#define selectWidth (([[UIScreen mainScreen] bounds].size.width - 18 * 2) / 3)

#define selectHeight 41

@implementation SelectView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubView];
    }
    return  self;
}

- (void)setUpSubView {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(18, 0, ([[UIScreen mainScreen] bounds].size.width - 18 * 2), selectHeight)];
    [backView setBackgroundColor:[UIColor whiteColor]];
    backView.center = self.center;
    backView.layer.shadowColor = [UIColor blackColor].CGColor;
    backView.layer.shadowOffset = CGSizeMake(0, 5);
    backView.layer.shadowOpacity = 0.18f;
    
    UIButton *dateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dateBtn.frame = CGRectMake(0, 0, selectWidth, selectHeight);
    [dateBtn setTitle:@"期限" forState:UIControlStateNormal];
    [dateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dateBtn addTarget:self action:@selector(selectDataLine) forControlEvents:UIControlEventTouchUpInside];
    [dateBtn setImageEdgeInsets:UIEdgeInsetsMake(0, selectWidth - 30, 0, 0)];
    [dateBtn setImage:[UIImage imageNamed:@"arrow_highest_nor"] forState:UIControlStateNormal];
    [backView addSubview:dateBtn];
    
    UIButton *moneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moneyBtn.frame = CGRectMake(selectWidth, 0, selectWidth, selectHeight);
    [moneyBtn setTitle:@"收益" forState:UIControlStateNormal];
    [moneyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moneyBtn addTarget:self action:@selector(selectmoneyBtn) forControlEvents:UIControlEventTouchUpInside];
    [moneyBtn setImageEdgeInsets:UIEdgeInsetsMake(0, selectWidth - 30, 0, 0)];
    [moneyBtn setImage:[UIImage imageNamed:@"arrow_highest_nor"] forState:UIControlStateNormal];
    [backView addSubview:moneyBtn];
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(selectWidth * 2, 0, selectWidth, selectHeight);
    [selectBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(selectSelectType) forControlEvents:UIControlEventTouchUpInside];
    [selectBtn setImageEdgeInsets:UIEdgeInsetsMake(0, selectWidth - 30, 0, 0)];
    [selectBtn setImage:[UIImage imageNamed:@"arrow_highest_nor"] forState:UIControlStateNormal];
    [backView addSubview:selectBtn];
    
    [self addSubview:backView];
}

//选择时间期限
- (void)selectDataLine {
    if (self.delegate) {
        [self.delegate selectView:self type:SELECT_DATEBTN];
    }
}
//选择收益
- (void)selectmoneyBtn {
    if (self.delegate) {
        [self.delegate selectView:self type:SELECT_MONEY];
    }
}
//选择类型
- (void)selectSelectType {
    if (self.delegate) {
        [self.delegate selectView:self type:SELECT_SELECT];
    }
}

@end
