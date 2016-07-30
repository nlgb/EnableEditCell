//
//  WSTextViewCell.m
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSTextViewCell.h"

@implementation WSTextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textView.layer.masksToBounds = YES;
    self.textView.layer.cornerRadius = 5.f;
    self.textView.textColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setContent:(NSString *)contentText {
    self.textView.text = contentText;
}
@end
