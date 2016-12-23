//
//  YVAlertView.m
//  XXT
//
//  Created by xue.
//  Copyright (c) 2013年 . All rights reserved.
//

#import "UIPopupView.h"
#import "UIColor_Extension.h"
#import "Macors.h"

#define VIEW_WIDTH              SCREEN_WIDTH*0.8
#define BUTTON_WIDTH            VIEW_WIDTH * 0.4
#define TEXT_COLOR              [UIColor blackColor]

#define SELECT_BACKGROUD_COLOR  [UIColor orangeColor]
#define TITLE_FONT_SIZE 22.0
#define TEXT_FONT_SIZE 18.0



@interface UIPopupView()<UITextFieldDelegate>{
    UIPopupViewDismissBlock _dismissBlock;
    UIImageView* _contextView;
    UILabel* _titleLabel;
    UITextField *_textField;
}
@property (nonatomic, strong) UIView *bgView;
@end

//
// 实现：提示框
//
@implementation UIPopupView

@synthesize viewController;

// 初始化
-(id) init
{
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)]){
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIView* backgroudView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [backgroudView setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4f]];
        [self addSubview:backgroudView];
        self.bgView = backgroudView;
        
        // 设置单击
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                   action:@selector(singleTapAction)];
        [backgroudView addGestureRecognizer:singleTap];
        
    }
    return self;
}

// 添加背景和标题
-(void) addBackgroundWithMessage:(NSString*) message
                    contentWidth:(CGFloat)contentWidth
                   contentHeight:(CGFloat)contentHeight;
{
    CGRect imageRect;
    if (message == nil || [message isEqualToString:@""]) {
        //不要标题栏
        imageRect = CGRectMake((SCREEN_WIDTH-contentWidth)/2, (SCREEN_HEIGHT - contentHeight)/2, contentWidth, contentHeight);
        
        _contextView = [[UIImageView alloc] initWithFrame:imageRect];
        [_contextView setBackgroundColor:[UIColor grayColor]];
        _contextView.layer.masksToBounds = YES;
        _contextView.layer.cornerRadius = 8.0;
        _contextView.layer.borderWidth =1;
        _contextView.layer.borderColor = [UIColor whiteColor].CGColor;
        [_contextView setUserInteractionEnabled:YES];
        [self addSubview:_contextView];
        return;
    }
    // 计算文字高度
    CGSize maxSize = CGSizeMake(contentWidth, MAXFLOAT);
    CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE]
                          constrainedToSize:maxSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    // 添加背景
    imageRect = CGRectMake((SCREEN_WIDTH-contentWidth)/2, (SCREEN_HEIGHT - textSize.height- contentHeight) / 2, contentWidth,textSize.height+ contentHeight + 20);
    
    _contextView = [[UIImageView alloc] initWithFrame:imageRect];
    [_contextView setBackgroundColor:[UIColor grayColor]];
    [_contextView setUserInteractionEnabled:YES];
    _contextView.layer.masksToBounds = YES;
    _contextView.layer.cornerRadius = 8.0;
    _contextView.layer.borderWidth =1;
    _contextView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:_contextView];
    
    // 添加标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, contentWidth, textSize.height)];
    _titleLabel.text = message;
    _titleLabel.font = [UIFont systemFontOfSize:TITLE_FONT_SIZE];
    _titleLabel.textColor = TEXT_COLOR;
    [_titleLabel setNumberOfLines:0];
    [_titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    // 如果只有一行文本，居中显示
    if (textSize.height < 30.0f)
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_contextView addSubview:_titleLabel];
    
    UITapGestureRecognizer *resignGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:resignGesture];
    
}

- (void)tap
{
    [_textField becomeFirstResponder];
}
-(void)singleTapAction
{
    
    [self dismissWithButtonIndex:POPUP_BUTTON_CANCEL reponsed:nil];
}

// 转换为提示2
-(void) transformToNotifyWith2:(NSString *)title Message:(NSString* ) message buttonTitle:(NSString * ) buttonTitle
{
    // 计算文字高度
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH*0.8, MAXFLOAT);
    CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]
                          constrainedToSize:maxSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    [self addBackgroundWithMessage:title contentWidth:SCREEN_WIDTH*0.9 contentHeight:textSize.height+ 30+30+44+10];
    _contextView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.9];
    CGFloat contentTop = _titleLabel.frame.size.height + 30;
    
    
    UILabel * textView = [[UILabel alloc] initWithFrame:CGRectMake(0, contentTop, SCREEN_WIDTH*0.9, textSize.height)];
    [textView setNumberOfLines:0];
    [textView setLineBreakMode:NSLineBreakByWordWrapping];
    [textView setText:message];
    [textView setCenter:CGPointMake(_contextView.center.x, contentTop+textSize.height/2.0)];
    
    [textView setFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]];
    [textView setTextColor:[UIColor colorWithHex:0x333333 alpha:1.0]];
    [textView setTextAlignment:NSTextAlignmentLeft];
    [_contextView addSubview:textView];
    
    contentTop += (textSize.height+30);
    
    // 添加按钮
     UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((_contextView.frame.size.width - VIEW_WIDTH+40)* 0.5,contentTop, VIEW_WIDTH-40, 44)];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHex:0xf7f7f7 alpha:1.0] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithHex:0x2a81a6 alpha:1.0];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3.0;
    [button setTag:POPUP_BUTTON_OK];
    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:button];
}

// 转换为提示
-(void) transformToNotifyWith:(NSString *)title Message:(NSString* ) message buttonTitle:(NSString * ) buttonTitle
{
    // 计算文字高度
    CGSize maxSize = CGSizeMake(VIEW_WIDTH, MAXFLOAT);
    CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]
                          constrainedToSize:maxSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    [self addBackgroundWithMessage:title contentWidth:VIEW_WIDTH contentHeight:textSize.height+ 30+30+44+10];
    _contextView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.9];
    CGFloat contentTop = _titleLabel.frame.size.height + 30;
    
    
    UILabel * textView = [[UILabel alloc] initWithFrame:CGRectMake(0, contentTop, VIEW_WIDTH, textSize.height)];
    [textView setNumberOfLines:0];
    [textView setLineBreakMode:NSLineBreakByWordWrapping];
    [textView setText:message];
    [textView setFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]];
    [textView setTextColor:[UIColor colorWithHex:0x333333 alpha:1.0]];
    [textView setTextAlignment:NSTextAlignmentCenter];
    [_contextView addSubview:textView];
    
    contentTop += (textSize.height+30);
    
    // 添加按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10,contentTop, VIEW_WIDTH-20, 44)];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHex:0xf7f7f7 alpha:1.0] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithHex:0x2a81a6 alpha:1.0];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3.0;
    [button setTag:POPUP_BUTTON_OK];
    [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:button];
}

// 转换为确定
-(void) transformToConfirmWith:(NSString *)title Message:(NSString* ) message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle
{
    // 计算文字高度
    CGSize maxSize = CGSizeMake(VIEW_WIDTH, MAXFLOAT);
    CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]
                          constrainedToSize:maxSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    [self addBackgroundWithMessage:title contentWidth:VIEW_WIDTH contentHeight:textSize.height + 30+30+44+10];
    _contextView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.9];
    
    CGFloat contentTop = _titleLabel.frame.size.height + 30;
    
    UILabel * textView = [[UILabel alloc] initWithFrame:CGRectMake(0, contentTop, VIEW_WIDTH, textSize.height)];
    [textView setNumberOfLines:0];
    [textView setLineBreakMode:NSLineBreakByWordWrapping];
    [textView setText:message];
    [textView setFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]];
    [textView setTextColor:[UIColor colorWithHex:0x333333 alpha:1.0]];
    [textView setTextAlignment:NSTextAlignmentCenter];
    [_contextView addSubview:textView];
    
    contentTop += (textSize.height+30);
    
    // 添加按钮
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20,contentTop, BUTTON_WIDTH, 44)];
    [cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithHex:0xf7f7f7 alpha:1.0] forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor colorWithHex:0xb4b5b5 alpha:1.0];
    cancelButton.layer.masksToBounds = YES;
    cancelButton.layer.cornerRadius = 3;
    
    [cancelButton setTag:POPUP_BUTTON_CANCEL];
    [cancelButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:cancelButton];
    
    
    // 添加按钮
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(VIEW_WIDTH-cancelButton.frame.size.width-20,contentTop, BUTTON_WIDTH, 44)];
    [confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor colorWithHex:0xf7f7f7 alpha:1.0] forState:UIControlStateNormal];
    confirmButton.backgroundColor = [UIColor colorWithHex:0x2a81a6 alpha:1.0];
    confirmButton.layer.masksToBounds = YES;
    confirmButton.layer.cornerRadius = 3.0;
    [confirmButton setTag:POPUP_BUTTON_OK];
    [confirmButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:confirmButton];
}





// 转换为actionsheet
-(void) transformToActionsheetWithTitle:(NSString *)title Message:(NSString* ) message buttonTitles:(NSArray *)buttonTitles
{
    [self addBackgroundWithMessage:message contentWidth:VIEW_WIDTH contentHeight:buttonTitles.count * 45 + 44];
    
    _contextView.backgroundColor = [UIColor whiteColor];
    _titleLabel.textColor = [UIColor colorWithHex:0x383635 alpha:1.0];
    // 循环添加按钮
    CGFloat contentTop = _titleLabel.frame.size.height + 30;
    if (message == nil || [message isEqualToString:@""]) {
        contentTop -= 30;
    }
    int index = 0;
    for (NSString* buttonTitle in buttonTitles) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,contentTop, VIEW_WIDTH, 44)];
        [button setTitle:buttonTitle forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor colorWithHex:0x383635 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTag:index];
        [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(touchButtonDown:) forControlEvents:UIControlEventTouchDown];
        [_contextView addSubview:button];
        
        contentTop += 44;
        
        if (index >= 1 && index < buttonTitles.count -1) {
            UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(10, contentTop, VIEW_WIDTH-20, 0.5)];
            [lineView setBackgroundColor:[UIColor colorWithHex:0xc3c3c3 alpha:1.0]];
            [_contextView addSubview:lineView];
            
            contentTop += 0.5;

        }else if (index == 0)
        {
            
            UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(10, contentTop, VIEW_WIDTH-20, 0.5)];
            [lineView setBackgroundColor:[UIColor colorWithHex:0xc3c3c3 alpha:1.0]];
            [_contextView addSubview:lineView];
            
            contentTop += 0.5;
            
        }else{

        }
        
        index ++;
    }
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(10, contentTop, VIEW_WIDTH-20, 0.5)];
    [lineView setBackgroundColor:[UIColor colorWithHex:0xc3c3c3 alpha:1.0]];
    [_contextView addSubview:lineView];
    
    contentTop += 0.5;
    // 添加取消按钮
    UIButton *cancelButton= [[UIButton alloc] initWithFrame:CGRectMake(0,contentTop, VIEW_WIDTH, 44)];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton setTitleColor:[UIColor colorWithHex:0x383635 alpha:1.0] forState:UIControlStateNormal];
    
    [cancelButton setTag:POPUP_BUTTON_CANCEL];
    [cancelButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:cancelButton];
}

// 转换为输入
-(void) transformToInputWithTitle:(NSString *)title Message:(NSString* ) message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle
{
    // 计算文字高度
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH * 0.9 - 40, MAXFLOAT);
    
    CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE]
                          constrainedToSize:maxSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    [self addBackgroundWithMessage:title contentWidth:SCREEN_WIDTH * 0.9 contentHeight:30+textSize.height+ 20+40+30+44+20];
    
    _contextView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.9];
    CGFloat contentTop = _titleLabel.frame.size.height + 30;
    
    UILabel * textView = [[UILabel alloc] initWithFrame:CGRectMake(20, contentTop, SCREEN_WIDTH * 0.9 - 40, textSize.height)];
    [textView setNumberOfLines:0];
    [textView setLineBreakMode:NSLineBreakByWordWrapping];
    [textView setText:message];
    [textView setFont:[UIFont systemFontOfSize:TITLE_FONT_SIZE]];
    [textView setTextColor:[UIColor colorWithHex:0x717171 alpha:1.0]];
    [textView setTextAlignment:NSTextAlignmentLeft];
    [_contextView addSubview:textView];
    
    contentTop += (textSize.height+20);
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(20, contentTop, SCREEN_WIDTH * 0.9 - 40, 40)];
    [textfield setBackgroundColor:[UIColor whiteColor]];
    textfield.placeholder = @"Name";
    textfield.textAlignment = NSTextAlignmentLeft;
    textfield.returnKeyType = UIReturnKeyDone;
    textfield.userInteractionEnabled = YES;
    textfield.delegate = self;
    [_contextView addSubview:textfield];
    _textField = textfield;
    contentTop += 70;
    
    
    // 添加按钮
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(20,contentTop, BUTTON_WIDTH, 44)];
    [cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithHex:0xf7f7f7 alpha:1.0] forState:UIControlStateNormal];
    cancelButton.backgroundColor = [UIColor colorWithHex:0xb4b5b5 alpha:1.0];
    cancelButton.layer.masksToBounds = YES;
    cancelButton.layer.cornerRadius = 3;
    
    [cancelButton setTag:POPUP_BUTTON_CANCEL];
    [cancelButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:cancelButton];
    
    
    // 添加按钮
    UIButton *confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.9 - cancelButton.frame.size.width-20,contentTop, BUTTON_WIDTH, 44)];
    [confirmButton setTitle:confirmTitle forState:UIControlStateNormal];
    [confirmButton setTitleColor:[UIColor colorWithHex:0xf7f7f7 alpha:1.0] forState:UIControlStateNormal];
    confirmButton.backgroundColor = [UIColor colorWithHex:0x2a81a6 alpha:1.0];
    confirmButton.layer.masksToBounds = YES;
    confirmButton.layer.cornerRadius = 3.0;
    [confirmButton setTag:POPUP_BUTTON_OK];
    [confirmButton addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
    [_contextView addSubview:confirmButton];
}

//装换为tableView
- (void)transformToTableViewWithMessage:(NSArray *)array
{
    // 计算文字高度
    CGSize maxSize = CGSizeMake(VIEW_WIDTH, MAXFLOAT);
    
    NSString *message = [array objectAtIndex:0];
    CGSize textSize = [message sizeWithFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]
                          constrainedToSize:maxSize
                              lineBreakMode:NSLineBreakByWordWrapping];
    
    [self addBackgroundWithMessage:nil contentWidth:VIEW_WIDTH contentHeight:(textSize.height + 30) * array.count];
    _contextView.backgroundColor = [UIColor colorWithHex:0xffffff alpha:0.9];
    
    for (int i = 0; i < array.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        
        button.frame = CGRectMake(0, i * (textSize.height + 30.f), VIEW_WIDTH, textSize.height + 30.f - 2.f);
        [button setTitle:[array objectAtIndex:i] forState: UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHex:0x717171 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:RGB(233, 153, 152) forState:UIControlStateHighlighted];
        [button setTag:i];
        [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [_contextView addSubview:button];
        
        if (i < (array.count - 1)) {
            UIView *underLine = [[UIView alloc] initWithFrame:CGRectMake(VIEW_WIDTH * 0.1 * 0.5, MaxY(button.frame) + 1.f, 0.9 * VIEW_WIDTH, 0.5)];
            underLine.backgroundColor = RGB(208, 214, 215);
            [_contextView addSubview:underLine];

        }
    }
    
    
}

// 按下一个按钮。
-(void)touchButton:(UIButton*)button
{
    [self dismissWithButtonIndex:(int)button.tag reponsed:_textField.text];
}
// 按下一个按钮。
-(void)touchButtonDown:(UIButton*)button
{
    button.backgroundColor = [UIColor colorWithHex:0xe99212 alpha:0.9];
}

// 显示
-(void) show
{
    if (self.viewController == nil){
        UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
        [appWindow addSubview:self];
    } else {
        [self.viewController.view addSubview:self];
    }
    
    CGRect rect = _contextView.frame;
    CGRect originalRect = rect;
    rect.origin.y = self.bounds.size.height;
    _contextView.frame = rect;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _contextView.frame = originalRect;
                     }
                     completion:nil
     ];
}

-(void) setDismissBlock:(UIPopupViewDismissBlock)block
{
    _dismissBlock = block;
}

// 隐藏弹出框
-(void) dismissWithButtonIndex:(int)buttonIndex reponsed:(id)reponsed
{
    UIPopupViewDismissBlock block = _dismissBlock;
    
    CGRect rect = _contextView.frame;
    rect.origin.y = self.bounds.size.height;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _contextView.frame = rect;
                     }
                     completion:^(BOOL finished) {
                         // 移除
                         [self removeFromSuperview];
                         
                         // 调用销毁代码
                         if (block != nil)
                             block(buttonIndex, reponsed);
                     }
     ];
}

// 通知
+ (UIPopupView* ) notifyViewWithTitle:(NSString *)title Message:(NSString *)message buttonTitle:(NSString *)buttonTitle
{
    UIPopupView* popupView = [[UIPopupView alloc] init];
    [popupView transformToNotifyWith:title Message:message buttonTitle:buttonTitle];
    return popupView;
}
// 确定
+ (UIPopupView* ) confirmViewWithTitle:(NSString *)title Message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle
{
    UIPopupView* popupView = [[UIPopupView alloc] init];
    [popupView transformToConfirmWith:title Message:message cancelButtonTitle:cancelTitle confirmButtonTitle:confirmTitle];
    return popupView;
}


//分行提示框
+ (void)LabelViewWithTitle:(NSString *) title Message:(NSString * ) message OKButtonTitle:(NSString *)buttonTitle block:(UIPopupViewDismissBlock)block
{
    UIPopupView* popupView = [UIPopupView notifyRowsViewWithTitle:title Message:message buttonTitle:buttonTitle];
    [popupView setDismissBlock:block];
    [popupView show];
 
}
//分行提示
+ (UIPopupView* ) notifyRowsViewWithTitle:(NSString *)title Message:(NSString *)message buttonTitle:(NSString *)buttonTitle
{
    UIPopupView* popupView = [[UIPopupView alloc] init];
    [popupView transformToNotifyWith2:title Message:message buttonTitle:buttonTitle];
    return popupView;
}


// 选择ActionSheet
+ (UIPopupView* ) actionSheetViewWithTitle:(NSString *)title Message:(NSString *)message buttonTitles:(NSArray *)buttonTitles
{
    UIPopupView* popupView = [[UIPopupView alloc] init];
    [popupView transformToActionsheetWithTitle:title Message:message buttonTitles:buttonTitles];
    return popupView;
}

+ (UIPopupView* ) inputViewWithTitle:(NSString *)title Message:(NSString* ) message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle
{
    UIPopupView* popupView = [[UIPopupView alloc] init];
    [popupView transformToInputWithTitle:title Message:message cancelButtonTitle:cancelTitle confirmButtonTitle:confirmTitle];
    return popupView;
}

+ (UIPopupView *)tableViewWithMessage:(NSArray *)message
{
    UIPopupView* popupView = [[UIPopupView alloc] init];
    [popupView transformToTableViewWithMessage:message];
    return popupView;
}

// 显示通知
+(void)showNotifyWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle block:(UIPopupViewDismissBlock)block
{
    UIPopupView* popupView = [UIPopupView notifyViewWithTitle:title Message:message buttonTitle:buttonTitle];
    [popupView setDismissBlock:block];
    
    [popupView show];
}
// 显示确定
//+(void) showConfirm:(NSString *)message title:(NSString *)title block:(UIPopupViewDismissBlock)block
//{
//    [UIPopupView showConfirm:message cancelButtonTitle:@"取消" confirmButtonTitle:@"确定" block:block];
//}
//+(void) showConfirm:(NSString *)message block:(UIPopupViewDismissBlock)block
//{
//    [UIPopupView showConfirm:message cancelButtonTitle:@"取消" confirmButtonTitle:@"确定" block:block];
//}
+(void) showConfirmTitle:(NSString *)title Message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle block:(UIPopupViewDismissBlock)block
{
    UIPopupView* popupView = [UIPopupView confirmViewWithTitle:title Message:message cancelButtonTitle:cancelTitle confirmButtonTitle:confirmTitle];
    [popupView setDismissBlock:block];
    [popupView show];
}


// 显示选择ActionSheet
+ (void)showActionSheetWithTitle:(NSString *)title Message:(NSString *)message buttonTitles:(NSArray *)buttonTitles block:(UIPopupViewDismissBlock)block
{
    UIPopupView* popupView = [UIPopupView actionSheetViewWithTitle:title Message:message buttonTitles:buttonTitles];
    [popupView setDismissBlock:block];
    [popupView show];
}

+(void)showInputView:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle confirmButtonTitle:(NSString *)confirmTitle block: (UIPopupViewDismissBlock) block
{
    UIPopupView *popupView = [UIPopupView inputViewWithTitle:title Message:message cancelButtonTitle:cancelTitle confirmButtonTitle:confirmTitle];
    [popupView setDismissBlock:block];
    [popupView show];
}



// 显示选择
+(void) showChooseMessage:(NSString *)message title:(NSString *)title buttonTitles:(NSArray *)buttonTitles block:(UIPopupViewDismissBlock)block
{
    UIPopupView* popupView = [UIPopupView chooseViewWithMessage:message buttonTitles:buttonTitles];
    [popupView setDismissBlock:block];
    [popupView show];
}

+(void) showChoose:(NSString *)message buttonTitles:(NSArray *)buttonTitles block:(UIPopupViewDismissBlock)block
{
    UIPopupView* popupView = [UIPopupView chooseViewWithMessage:message buttonTitles:buttonTitles];
    [popupView setDismissBlock:block];
    [popupView show];
}

// 显示选择行
+ (void)showTableView:(NSArray *)message block:(UIPopupViewDismissBlock) block
{
    UIPopupView* popupView = [UIPopupView tableViewWithMessage:message];
    [popupView setDismissBlock:block];
    [popupView show];
}

#pragma mark - textField delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _textField) {
        [textField resignFirstResponder];
    }
    
    return true;
}

@end
