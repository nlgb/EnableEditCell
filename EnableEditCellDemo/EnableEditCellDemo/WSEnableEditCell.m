//
//  WSEnableEditCell.m
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSEnableEditCell.h"

@interface WSEnableEditCell ()


@end

@implementation WSEnableEditCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setContent:(NSString *)contentText {
    self.ContentLabel.text = contentText;
}

// 选中cell、touch、左滑删除会有冲突
// 要想多个对象处理事件，则需要调用super的默认方法，把事件顺着响应者链条上抛
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
    // 1.顺着响应者链条上抛点击事件
    [super touchesBegan:touches withEvent:event];
    
//    // 2.自己同时也处理该点击事件
//    UITouch *touch = touches.anyObject;
//    if (self.delegate && [self.delegate isKindOfClass:[UIView class]]) {
//        CGPoint point = [touch locationInView:(UIView *)self.delegate];
//        NSLog(@"point == %@",NSStringFromCGPoint(point));
//        
//        // 拿到label的frame
//        CGRect frame = self.ContentLabel.frame;
//        // 创建frame大小的UITextView
//        UITextView *tView = [[UITextView alloc] initWithFrame:frame];
//        // 设置UITextView属性
//        tView.backgroundColor = [UIColor lightGrayColor];
//        tView.layer.masksToBounds = YES;
//        tView.layer.cornerRadius = 5.f;
//        // 把内容放到UITextView
//        tView.text = self.ContentLabel.text;
//        // 把UITextView添加到cell上
//        [self.contentView addSubview:tView];
//        // 唤出键盘
//        [tView becomeFirstResponder];
//        
//    }
}
@end
