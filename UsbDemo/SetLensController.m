//
//  SetLensController.m
//  UsbDemo
//
//  Created by xuefei on 16/11/30.
//  Copyright © 2016年 xuefei. All rights reserved.
//

#import "SetLensController.h"
#import "CBBDataStructureConstant.h"

@interface SetLensController ()

@end


@implementation SetLensController
@synthesize lensParam,confirmButton,cancelButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    
}
-(void)setupUI
{
    lensParam = [[UITextField alloc] initWithFrame:CGRectMake(CBB_SCREEN_WIDTH/10, CBB_SCREEN_HEIGHT/7, 2*CBB_SCREEN_WIDTH/3, 40)];
    lensParam.layer.borderColor= [UIColor blueColor].CGColor;
    lensParam.layer.borderWidth= 1.0f;
    lensParam.borderStyle=UITextBorderStyleRoundedRect;
    lensParam.placeholder=@"设置lens参数";
    
    [self.view addSubview:lensParam];
    
    confirmButton = [[UIButton alloc] initWithFrame:CGRectMake(CBB_SCREEN_WIDTH/10, CBB_SCREEN_HEIGHT/4, CBB_SCREEN_WIDTH/6, CBB_SCREEN_HEIGHT/15)];
    [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(okBtn:) forControlEvents:UIControlEventTouchUpInside];
    [confirmButton setBackgroundColor:[UIColor grayColor]];
    
    
    cancelButton = [[UIButton alloc] initWithFrame:CGRectMake( 2*CBB_SCREEN_WIDTH/3, CBB_SCREEN_HEIGHT/4, CBB_SCREEN_WIDTH/6, CBB_SCREEN_HEIGHT/15)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:confirmButton];
    [self.view addSubview:cancelButton];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)okBtn:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)cancelBtn:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
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
