//
//  TextFieldCell.m
//  GCKongJian
//
//  Created by 高崇 on 2017/8/4.
//  Copyright © 2017年 LieLvWang. All rights reserved.
//

#import "TextFieldCell.h"

@interface TextFieldCell ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@end

@implementation TextFieldCell

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - lazy

- (UITextField *)textField
{
    return GC_LAZY(_textField, ({
        NSDictionary *dic = @{
                              @"title" : @"输入律师名字或关键词",
                              @"font" : [UIFont systemFontOfSize:14],
                              @"color" : [UIColor colorWithHexString:@"999999"]
                              };
        
        UITextField *view = [[UITextField alloc] init];
        view.attributedText = [@[dic] attributedString];
        view.font = [UIFont systemFontOfSize:14];
        view.clearButtonMode = UITextFieldViewModeWhileEditing;
        view.returnKeyType = UIReturnKeyDone;
        [self.contentView addSubview:view];
        view;
    }));
}

@end
