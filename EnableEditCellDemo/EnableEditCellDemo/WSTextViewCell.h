//
//  WSTextViewCell.h
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSTextViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (void)setContent:(NSString *)contentText;
@end
