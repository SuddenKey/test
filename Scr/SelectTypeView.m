//
//  SelectTypeView.m
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import "SelectTypeView.h"
#import "UIColor+otherColor.h"
#define KHeightSCREEN   [[UIScreen mainScreen] bounds].size.height

#define KWidthSCREEN    [[UIScreen mainScreen] bounds].size.width

#define kleftMarin      25

#define btnMarin        10

#define btnWidth        ((KWidthSCREEN - kleftMarin * 2 - btnMarin * 2) / 3)


@interface SelectTypeView ()

@property (nonatomic, assign) NSInteger alertViewHeight;

@property (nonatomic, strong) UIView  *backView;

@property (nonatomic, strong) NSMutableArray *moneyBtnArray;

@property (nonatomic, strong) NSMutableArray *proBtnArray;

@property (nonatomic, strong) NSMutableDictionary *clickData;


@end

@implementation SelectTypeView

- (NSMutableArray *)moneyBtnArray {
    if (_moneyBtnArray == nil) {
        _moneyBtnArray = [NSMutableArray array];
    }
    return _moneyBtnArray;
}

- (NSMutableDictionary *)clickData {
    if (_clickData == nil) {
        _clickData = [[NSMutableDictionary alloc] initWithDictionary:@{@"protype":@(0), @"moneyMonunt":@(0)}];
    }
    return _clickData;
}

- (NSMutableArray *)proBtnArray {
    if (_proBtnArray == nil) {
        _proBtnArray = [NSMutableArray array];
    }
    return _proBtnArray;
}

- (UIView *)alertView {
    if (_alertView == nil) {
        _alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidthSCREEN, 0)];
        _alertView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_alertView];
    }
    return _alertView;
}

- (instancetype)initWithProArray:(NSArray *)proArray moneyArray:(NSArray *)moneyArray {
    self = [super init];
    if (self) {
        self.proArray = proArray;
        self.moneyArray = moneyArray;
        self.frame = CGRectMake(0, 0, KWidthSCREEN, KHeightSCREEN);
        [self setUpView];
    }
    return self;
}


- (void)setUpView {
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidthSCREEN, KHeightSCREEN)];
    _backView.backgroundColor = [UIColor blackColor];
    _backView.alpha = 0.3;
    [self addSubview:_backView];
    
    UILabel *proLabel = [[UILabel alloc] initWithFrame:CGRectMake(kleftMarin, 27, KWidthSCREEN - kleftMarin * 2, 13)];
    proLabel.text = @"产品类型";
    proLabel.textColor = [UIColor blackColor];
    proLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.alertView addSubview:proLabel];
    
    for (int i = 0; i < self.proArray.count; i++) {
        UIButton *proBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        proBtn.frame = CGRectMake(kleftMarin + i % 3 * (btnMarin + btnWidth), CGRectGetMaxY(proLabel.frame) + btnMarin + i / 3 * (btnMarin + 34), btnWidth, 34);
        proBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [proBtn setTitle:self.proArray[i] forState:UIControlStateNormal];
        [proBtn addTarget:self action:@selector(btnClickPro:) forControlEvents:UIControlEventTouchUpInside];
        proBtn.layer.cornerRadius = 34 / 2;
        proBtn.layer.borderWidth = 1.0;
        if (i == 0) {
            [proBtn setTitleColor:[UIColor colorWithHex:@"#3699FF"] forState:UIControlStateNormal];
            proBtn.layer.borderColor = [UIColor colorWithHex:@"#3699FF"].CGColor;
        } else {
            [proBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            proBtn.layer.borderColor = [UIColor colorWithHex:@"#E7EAEE"].CGColor;
        }
        [self.alertView addSubview:proBtn];
        _alertViewHeight = CGRectGetMaxY(proBtn.frame);
        
        [self.proBtnArray addObject:proBtn];
    }
    
    UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kleftMarin, _alertViewHeight + 27, KWidthSCREEN - kleftMarin * 2, 13)];
    moneyLabel.text = @"起投金额";
    moneyLabel.textColor = [UIColor blackColor];
    moneyLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.alertView addSubview:moneyLabel];
    
    for (int i = 0; i < self.moneyArray.count; i++) {
        UIButton *proBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        proBtn.frame = CGRectMake(kleftMarin + i % 3 * (btnMarin + btnWidth), CGRectGetMaxY(moneyLabel.frame) + btnMarin + i / 3 * (btnMarin + 34), btnWidth, 34);
        proBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [proBtn setTitle:self.proArray[i] forState:UIControlStateNormal];
        [proBtn addTarget:self action:@selector(btnClickMoney:) forControlEvents:UIControlEventTouchUpInside];
        proBtn.layer.cornerRadius = 34 / 2;
        proBtn.layer.borderWidth = 1.0;
        
        if (i == 0) {
            [proBtn setTitleColor:[UIColor colorWithHex:@"#3699FF"] forState:UIControlStateNormal];
            proBtn.layer.borderColor = [UIColor colorWithHex:@"#3699FF"].CGColor;
        } else {
            [proBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            proBtn.layer.borderColor = [UIColor colorWithHex:@"#E7EAEE"].CGColor;
        }

        [self.alertView addSubview:proBtn];
        _alertViewHeight = CGRectGetMaxY(proBtn.frame);
        
        [self.moneyBtnArray addObject:proBtn];
    }
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, _alertViewHeight + 26, KWidthSCREEN / 2, 44);
    [backBtn setTitle:@"重置" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(getBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitleColor:[UIColor colorWithHex:@"3A6BFF"] forState:UIControlStateNormal];
    backBtn.layer.borderWidth = 1;
    backBtn.layer.borderColor = [UIColor colorWithHex:@"E7EAEE"].CGColor;
    [_alertView addSubview:backBtn];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(KWidthSCREEN / 2, _alertViewHeight + 26, KWidthSCREEN / 2, 44);
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setBackgroundColor:[UIColor colorWithHex:@"3A6BFF"]];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(getsubmit) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.layer.borderWidth = 1;
    sureBtn.layer.borderColor = [UIColor colorWithHex:@"E7EAEE"].CGColor;
    [_alertView addSubview:sureBtn];
    
    _alertViewHeight = CGRectGetMaxY(sureBtn.frame);
}

- (void)getBack{
    [self dismiss];
}

- (void)getsubmit {
    if (self.getClickType) {
        self.getClickType(self.clickData);
        [self dismiss];
    }
}

- (void)btnClickPro:(UIButton *)sender{
    for (int i = 0; i < self.proBtnArray.count; i ++) {
        UIButton *btn = self.proBtnArray[i];
        if (btn == sender) {
            [self.clickData setValue:@(i) forKey:@"protype"];
            [btn setTitleColor:[UIColor colorWithHex:@"#3699FF"] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor colorWithHex:@"#3699FF"].CGColor;
        } else {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor colorWithHex:@"#E7EAEE"].CGColor;
        }
    }
}


- (void)btnClickMoney:(UIButton *)sender {
    for (int i = 0; i < self.moneyBtnArray.count; i ++) {
        UIButton *btn = self.moneyBtnArray[i];
        if (btn == sender) {
            [self.clickData setValue:@(i) forKey:@"moneyMonunt"];
            [btn setTitleColor:[UIColor colorWithHex:@"#3699FF"] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor colorWithHex:@"#3699FF"].CGColor;
        } else {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor colorWithHex:@"#E7EAEE"].CGColor;
        }
    }
}

- (void)setAframe:(CGRect)aframe {
    _aframe = aframe;
    self.alertView.frame = CGRectMake(self.aframe.origin.x, self.aframe.origin.y + self.aframe.size.height, 0, 0);
    _backView.frame = CGRectMake(0, CGRectGetMaxY(aframe), KWidthSCREEN, KHeightSCREEN - CGRectGetMaxY(aframe));
}

- (void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(1.08, 1.08);
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
        self.alertView.frame = CGRectMake(self.aframe.origin.x, self.aframe.origin.y + self.aframe.size.height, KWidthSCREEN, self.alertViewHeight);
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.alertView.frame = CGRectMake(0, KHeightSCREEN, KWidthSCREEN, 300);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
