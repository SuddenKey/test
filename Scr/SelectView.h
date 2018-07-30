//
//  SelectView.h
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum  SELECT_TYPE {
    SELECT_DATEBTN = 0,
    SELECT_MONEY,
    SELECT_SELECT
}SELECT_TYPE;


@class SelectView;
@protocol SelectViewDelegate
 
- (void)selectView:(SelectView *)view type:(SELECT_TYPE)type;

@end

@interface SelectView : UIView

@property (nonatomic, assign) id<SelectViewDelegate>delegate;

@property (nonatomic, assign) SELECT_TYPE selectType;

@end
