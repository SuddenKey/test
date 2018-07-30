//
//  DeadlineModel.m
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import "DeadlineModel.h"

@implementation DeadlineModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _type = arc4random() % 2;
        _percent = @"4.00% ~ 4.40%";
        _dateMoney = @"30天·1万起投";
        NSInteger a = arc4random() % 2;
        for (int i = 0; i < a; i++) {
            _explain = [NSMutableArray array];
            if (i == 0) {
                [_explain addObject:@"结构性存款"];
            }
            if (i == 1) {
                [_explain addObject:@"添惊喜18057"];
            }
        }
        if (_type == 0) {
            _height = 112;
        }
        if (_type == 1) {
            _height = 84;
        }
        
    }
    return self;
}


@end
