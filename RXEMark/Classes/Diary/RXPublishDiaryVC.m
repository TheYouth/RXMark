//
//  RXPublishDiaryVC.m
//  RXEMark
//
//  Created by pingan on 2018/10/12.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXPublishDiaryVC.h"
#import "EMTheme.h"
#import "RXPlaceHolderTextView.h"
@interface RXPublishDiaryVC ()<UITextViewDelegate>

@property(nonatomic, strong)UIButton    *saveBtn;
@property(nonatomic, strong)RXPlaceHolderTextView   *inputTextView;

@end

@implementation RXPublishDiaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}
- (void)initUI{
    self.title = NSLocalizedString(@"写日记", nil);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil)
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithCustomView:self.saveBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    spaceItem.width = -116;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:spaceItem,saveItem, nil];
}
#pragma mark - handle methods
- (void)cancel{
    [self closeKeyboard];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil
                                                                     message:NSLocalizedString(@"确定要放弃此次修改吗?", nil) preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(self)weakSelf = self;
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确认", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil];
    [alertVC addAction:confirmAction];
    [alertVC addAction:cancelAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}
- (void)closeKeyboard{
    [self.inputTextView resignFirstResponder];
}
- (void)saveBtnClick:(UIButton *)sender{
    [self closeKeyboard];
    
}
#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.markedTextRange == nil) {
        
    }
}
- (UIButton *)saveBtn{
    if (!_saveBtn) {
        _saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_saveBtn setTitle:NSLocalizedString(@"保存", nil) forState:UIControlStateNormal];
        [_saveBtn addTarget:self action:@selector(saveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_saveBtn setTitleColor:UIColorFromHexRGB(0x23A24D) forState:UIControlStateNormal];
        [_saveBtn.titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    }
    return _saveBtn;
}
- (RXPlaceHolderTextView *)inputTextView{
    if (!_inputTextView) {
        _inputTextView = [[RXPlaceHolderTextView alloc] initWithFrame:CGRectZero];
        _inputTextView.backgroundColor = UIColor.whiteColor;
        _inputTextView.placeHolder = NSLocalizedString(@"记录下此刻的心情吧...", nil);
        _inputTextView.font = [UIFont systemFontOfSize:15.0];
        _inputTextView.delegate = self;
    }
    return _inputTextView;
}
@end
