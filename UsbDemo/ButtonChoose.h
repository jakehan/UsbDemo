//
//  ButtonChoose.h
//  UsbDemo
//
//  Created by xuefei on 16/11/30.
//  Copyright © 2016年 xuefei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBBDataStructureConstant.h"

@interface ButtonChoose : UIControl

- (id)initWithFrame:(CGRect)frame;


@property(nonatomic,strong) UIButton *startButton;
@property(nonatomic,strong) UIButton *stopButton;
@property(nonatomic,strong) UIButton *streamButton;
@property(nonatomic,strong) UIButton *getLensButton;
@property(nonatomic,strong) UIButton *getVersionButton;
@property(nonatomic,strong) UIButton *setLensButton;
@property(nonatomic,strong) UIButton *setWhiteBalanceButton;
@property(nonatomic,strong) UIButton *setTimeButton;
@property(nonatomic,strong) UIButton *firmwareButton;
@end
