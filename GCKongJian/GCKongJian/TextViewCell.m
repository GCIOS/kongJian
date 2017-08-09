//
//  TextViewCell.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/9.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "TextViewCell.h"
#import "FSTextView.h"

@interface TextViewCell ()<UITextViewDelegate>

@property (nonatomic, strong) FSTextView *textView;

@end


@implementation TextViewCell

#pragma mark - UITextViewDelegate

- (BOOL)textView:(FSTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


#pragma mark - lazy

- (FSTextView *)textView
{
    return GC_LAZY(_textView, ({
        FSTextView *view = [[FSTextView alloc]init];
        view.placeholder = @"";
        view.placeholderColor = [UIColor colorWithHexString:@""];
        view.font = [UIFont systemFontOfSize:13];
        view.delegate = self;
        view.maxLength = 200;
        view.returnKeyType = UIReturnKeyDone;
        [self.contentView addSubview:view];
        view;
    }));
}

@end
