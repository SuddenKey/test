//
//  SelectTypeView.h
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SelectTypeView : UIView

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, copy)   NSArray *proArray;

@property (nonatomic, copy)   NSArray *moneyArray;

@property (nonatomic, copy)   void (^getClickType)(NSDictionary *data);

@property (nonatomic, assign) CGRect aframe;

- (instancetype)initWithProArray:(NSArray *)proArray moneyArray:(NSArray *)moneyArray;


- (void)show;

- (void)dismiss;

@end
