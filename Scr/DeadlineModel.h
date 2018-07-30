//
//  DeadlineModel.h
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum TYPE_CELL {
    TYPE_KEEP = 0,
    TYPE_NOKEEP
}TYPE_CELL;


@interface DeadlineModel : NSObject

@property (nonatomic, assign) TYPE_CELL type;
//百分比
@property (nonatomic, copy) NSString *percent;
//date and money
@property (nonatomic, copy) NSString *dateMoney;
//explain
@property (nonatomic, strong) NSMutableArray *explain;

@property (nonatomic, assign) NSInteger height;


@end
