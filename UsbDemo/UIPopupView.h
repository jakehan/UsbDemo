//
//  UIMessageView.h
//  XXT
//
//  Created by xue.
//  Copyright (c) 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>

#define POPUP_BUTTON_CANCEL -1
#define POPUP_BUTTON_OK     0

//
// 定义: 关闭Pop窗体时的调用代码
//
typedef void (^UIPopupViewDismissBlock)(int buttonIndex, id responsed);

// 消息视图

@interface UIPopupView : UIView

@property (nonatomic,assign) UIViewController* viewController;


// 显示确认
+ (void) showConfirmTitle:(NSString *)title Message:(NSString *)message cancelButtonTitle:(NSString *) cancelTitle confirmButtonTitle:(NSString *) confirmTitle block: (UIPopupViewDismissBlock) block;
// 显示选择
+(void)showActionSheetWithTitle:(NSString *) title Message:(NSString* ) message buttonTitles:(NSArray *)buttonTitles block:(UIPopupViewDismissBlock)block;

/**
 *  输入弹出框
 */
+(void)showInputView:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle block: (UIPopupViewDismissBlock) block;

// 显示通知
+ (void) showNotifyWithTitle:(NSString *)title message:(NSString* ) message buttonTitle:(NSString *) buttonTitle block: (UIPopupViewDismissBlock) block;

// 显示多行选择
+ (void)showTableView:(NSArray *)message block:(UIPopupViewDismissBlock) block;

#pragma mark private
// 设置消失后的处理代码
-(void) setDismissBlock:(UIPopupViewDismissBlock)block;
// 显示
-(void) show;
// 隐藏弹出框
-(void) dismissWithButtonIndex:(int)buttonIndex;

// 通知
+ (UIPopupView* ) notifyViewMessage:(NSString* ) message buttonTitle:(NSString * ) buttonTitle;

+ (UIPopupView* ) notifyViewWithTitle:(NSString *)title Message:(NSString *)message buttonTitle:(NSString *)buttonTitle;

// 确认
+ (UIPopupView* ) confirmViewWithTitle:(NSString *)title Message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle;
// 选择
+ (UIPopupView* ) chooseViewWithMessage:(NSString* ) message buttonTitles:(NSArray *)buttonTitles;

// 选择ActionSheet
+ (UIPopupView* ) actionSheetViewWithTitle:(NSString *) title Message:(NSString* ) message buttonTitles:(NSArray *)buttonTitles;


//分行提示框
+ (void)LabelViewWithTitle:(NSString *) title Message:(NSString * ) message OKButtonTitle:(NSString *)buttonTitle block:(UIPopupViewDismissBlock)block;



@end