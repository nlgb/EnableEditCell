//
//  WSEnableEditCell.h
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WSEnableEditCellDelegate <NSObject>

@optional

- (void)beginEditCellContent;

- (void)endEditCellContent;

@end

@interface WSEnableEditCell : UITableViewCell



- (void)setContent:(NSString *)contentText;
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;

@property(nonatomic,weak) id<WSEnableEditCellDelegate> delegate;

@end
