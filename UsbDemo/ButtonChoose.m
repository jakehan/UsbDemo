//
//  ButtonChoose.m
//  UsbDemo
//
//  Created by xuefei on 16/11/30.
//  Copyright © 2016年 xuefei. All rights reserved.
//

#import "ButtonChoose.h"
#import <Masonry/Masonry.h>

@implementation ButtonChoose

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupControlUI];
        
    }
    return self;
    
}

- (void)setupControlUI
{
    [self setupButtons];
    
    [self.startButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo   (self.top).offset(CBB_SCREEN_HEIGHT/7);
        make.left.equalTo  (self.left).offset(CBB_SCREEN_WIDTH/20);
        make.bottom.equalTo(self.streamButton.top).offset(CBB_SCREEN_HEIGHT/10);
        make.right.equalTo (self.stopButton.left).offset(-CBB_SCREEN_WIDTH/15);
        make.width.equalTo (self.width).multipliedBy(0.4f);
        make.height.equalTo(self.height).multipliedBy(0.07f);
        
    }];
    
        [self.stopButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.top).offset(CBB_SCREEN_HEIGHT/7);
            make.left.equalTo  (self.startButton.right).offset(CBB_SCREEN_WIDTH/15);
            make.bottom.equalTo(self.streamButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.right.equalTo (self.right).offset(CBB_SCREEN_WIDTH/15);
            make.width.equalTo (self.startButton.width);
            make.height.equalTo(self.startButton.height);
    
        }];
    
        [self.streamButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.startButton.bottom).offset(CBB_SCREEN_HEIGHT/10);
            make.left.equalTo  (self.left).offset(CBB_SCREEN_WIDTH/12);
            make.bottom.equalTo(self.getLensButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.width).multipliedBy(0.8f);
            make.height.equalTo(self.height).multipliedBy(0.07f);
    
        }];

        [self.getLensButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.streamButton.bottom).offset(-CBB_SCREEN_HEIGHT/10);
            make.left.equalTo  (self.streamButton.left);
            make.bottom.equalTo(self.getVersionButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.streamButton.width);
            make.height.equalTo(self.streamButton.height);
    
        }];

        [self.getVersionButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.getLensButton.bottom).offset(CBB_SCREEN_HEIGHT/20);
            make.left.equalTo  (self.streamButton.left);
            make.bottom.equalTo(self.setLensButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.streamButton.width);
            make.height.equalTo(self.streamButton.height);
    
        }];

        [self.setLensButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.getVersionButton.bottom).offset(CBB_SCREEN_HEIGHT/20);
            make.left.equalTo  (self.streamButton.left);
            make.bottom.equalTo(self.setWhiteBalanceButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.streamButton.width);
            make.height.equalTo(self.streamButton.height);
    
        }];

        [self.setWhiteBalanceButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.setLensButton.bottom).offset(CBB_SCREEN_HEIGHT/20);
            make.left.equalTo  (self.streamButton.left);
            make.bottom.equalTo(self.setTimeButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.streamButton.width);
            make.height.equalTo(self.streamButton.height);
    
        }];

        [self.setTimeButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.setWhiteBalanceButton.bottom).offset(CBB_SCREEN_HEIGHT/20);
            make.left.equalTo  (self.streamButton.left);
            make.bottom.equalTo(self.firmwareButton.top).offset(-CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.streamButton.width);
            make.height.equalTo(self.streamButton.height);
    
        }];

        [self.firmwareButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo   (self.setTimeButton.bottom).offset(CBB_SCREEN_HEIGHT/20);
            make.left.equalTo  (self.streamButton.left);
            make.bottom.equalTo(self.bottom).offset(CBB_SCREEN_HEIGHT/35);
            make.width.equalTo (self.streamButton.width);
            make.height.equalTo(self.streamButton.height);
    
        }];
    
    
}


- (void)setupButtons
{
    [self buttonCreate:self imageName:@"开始接收" viewTag:ViewBtnStart];//
    self.startButton = [self viewWithTag:ViewBtnStart];
    
    [self buttonCreate:self imageName:@"停止接收" viewTag:ViewBtnStop];
    self.stopButton = [self viewWithTag:ViewBtnStop];
    
    [self buttonCreate:self imageName:@"获取流信息" viewTag:ViewBtnStream];
    self.streamButton = [self viewWithTag:ViewBtnStream];
    
    [self buttonCreate:self imageName:@"获取lens参数" viewTag:ViewBtnGetLens];
    self.getLensButton = [self viewWithTag:ViewBtnGetLens];

    [self buttonCreate:self imageName:@"获取设备版本号" viewTag:ViewBtnGetVersion];
    self.getVersionButton = [self viewWithTag:ViewBtnGetVersion];
    
    [self buttonCreate:self imageName:@"设置lens参数" viewTag:ViewBtnSetLens];
    self.setLensButton = [self viewWithTag:ViewBtnSetLens];
    
    [self buttonCreate:self imageName:@"设置白平衡" viewTag:ViewBtnSetWhiteBalance ];
    self.setWhiteBalanceButton = [self viewWithTag:ViewBtnSetWhiteBalance];
    
    [self buttonCreate:self imageName:@"设置相机时间" viewTag:ViewBtnSetTime];
    self.setTimeButton = [self viewWithTag:ViewBtnSetTime];
    
    [self buttonCreate:self imageName:@"固件升级" viewTag:ViewBtnFirmware ];
    self.firmwareButton = [self viewWithTag:ViewBtnFirmware];
    
    
    
}
- (void) buttonCreate:(UIView *)aParentView  imageName:(NSString *)aImageName viewTag:(int)aViewTag{
    
    UIButton *aBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [aBtn setTranslatesAutoresizingMaskIntoConstraints: NO];
    [aBtn setTitle:aImageName forState:UIControlStateNormal];
    [aBtn setBackgroundColor:[UIColor grayColor]];
    [aBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [aBtn setTag:aViewTag];
    [aParentView addSubview:aBtn];
    
}


@end
