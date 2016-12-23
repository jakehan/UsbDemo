//
//  ViewController.m
//  UsbDemo
//
//  Created by xuefei on 16/11/29.
//  Copyright © 2016年 xuefei. All rights reserved.
//

#import "ViewController.h"
#import "UIPopupView.h"
#import "SetLensController.h"
#import "SetWhiteBalanceController.h"
#import "FirmwareUpdateController.h"
#import "RootViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.BtnChoose = [[ButtonChoose alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:self.BtnChoose];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnStart] addTarget:self action:@selector(onClickStart:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnStop] addTarget:self action:@selector(onClickStop:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnStream] addTarget:self action:@selector(onClickStream:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnGetLens] addTarget:self action:@selector(onClickGetLens:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnGetVersion] addTarget:self action:@selector(onClickGetVersion:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnSetLens] addTarget:self action:@selector(onClickSetLens:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnSetWhiteBalance] addTarget:self action:@selector(onClickSetWhiteBalance:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnSetTime] addTarget:self action:@selector(onClickSetTime:) forControlEvents:UIControlEventTouchUpInside];
    
    [(UIControl*)[self.BtnChoose viewWithTag:ViewBtnFirmware] addTarget:self action:@selector(onClickFirmware:) forControlEvents:UIControlEventTouchUpInside];
    

}

-(void)onClickStart:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)onClickStop:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)onClickStream:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [UIPopupView showNotifyWithTitle:@"流信息" message:nil buttonTitle:@"OK" block:^(int buttonIndex, id responsed) {
        
    }];
}

-(void)onClickGetLens:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [UIPopupView showNotifyWithTitle:@"lens参数信息" message:nil buttonTitle:@"OK" block:^(int buttonIndex, id responsed) {
        
    }];
}

-(void)onClickGetVersion:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [UIPopupView showNotifyWithTitle:@"设备信息" message:@"can not find endpoint out" buttonTitle:@"OK" block:^(int buttonIndex, id responsed) {
        
    }];
}

-(void)onClickSetLens:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    SetLensController * setLens = [[SetLensController alloc]init];
    [self.navigationController pushViewController:setLens animated:YES];
    //[self presentViewController:setLens animated:YES completion:nil];
    
}

-(void)onClickSetWhiteBalance:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    SetWhiteBalanceController *setWB = [[SetWhiteBalanceController alloc] init];
    [self.navigationController pushViewController:setWB animated:YES];
    
}

-(void)onClickSetTime:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [UIPopupView showConfirmTitle:@"设置时间" Message:nil cancelButtonTitle:@"系统时间" confirmButtonTitle:@"默认时间" block:^(int buttonIndex, id responsed) {
    }];

}

-(void)onClickFirmware:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    FirmwareUpdateController * firmware = [[FirmwareUpdateController alloc] init];

    [self.navigationController pushViewController:firmware animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
