//
//  headerTableViewCell.h
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *txtLabel1;
@property (weak, nonatomic) IBOutlet UILabel *txtLabel2;

@property (nonatomic, copy) NSArray *txtArray;


@end
