//
//  SetWhiteBalanceController.m
//  UsbDemo
//
//  Created by xuefei on 16/12/1.
//  Copyright © 2016年 xuefei. All rights reserved.
//

#import "SetWhiteBalanceController.h"
#import "CBBDataStructureConstant.h"

@interface SetWhiteBalanceController ()

@end

@implementation SetWhiteBalanceController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _lensParam = [[UITextField alloc] initWithFrame:CGRectMake(CBB_SCREEN_WIDTH/10, CBB_SCREEN_HEIGHT/7, 2*CBB_SCREEN_WIDTH/3, 40)];
    _lensParam.layer.borderColor= [UIColor blueColor].CGColor;
    _lensParam.layer.borderWidth= 1.0f;
    _lensParam.borderStyle=UITextBorderStyleRoundedRect;
    _lensParam.placeholder=@"设置白平衡";
    
    [self.view addSubview:_lensParam];
    
    _okButton = [[UIButton alloc] initWithFrame:CGRectMake(CBB_SCREEN_WIDTH/10, CBB_SCREEN_HEIGHT/4, CBB_SCREEN_WIDTH/6, CBB_SCREEN_HEIGHT/15)];
    [_okButton setTitle:@"确定" forState:UIControlStateNormal];
    [_okButton addTarget:self action:@selector(confirmBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_okButton setBackgroundColor:[UIColor grayColor]];
    
    
    _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake( 2*CBB_SCREEN_WIDTH/3, CBB_SCREEN_HEIGHT/4, CBB_SCREEN_WIDTH/6, CBB_SCREEN_HEIGHT/15)];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setBackgroundColor:[UIColor grayColor]];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_okButton];
    [self.view addSubview:_cancelButton];
    
}

-(void)confirmBtn:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)cancelBtn:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
