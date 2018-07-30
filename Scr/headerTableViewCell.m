//
//  headerTableViewCell.m
//  Scr
//
//  Created by 万浩 on 2018/7/3.
//  Copyright © 2018年 万浩. All rights reserved.
//

#import "headerTableViewCell.h"

@implementation headerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setTxtArray:(NSArray *)txtArray {
    _txtArray = txtArray;
    _txtLabel1.text = txtArray[0];
    _txtLabel2.text = txtArray[1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
