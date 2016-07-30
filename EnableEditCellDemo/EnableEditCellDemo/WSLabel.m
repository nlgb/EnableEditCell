//
//  WSLabel.m
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSLabel.h"

@implementation WSLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.numberOfLines = 0;

    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5.f;
    
    self.backgroundColor = [UIColor whiteColor];
}
@end
