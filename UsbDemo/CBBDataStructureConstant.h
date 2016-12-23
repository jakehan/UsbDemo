//
//  CBBDataStructureConstant.h
//  CBBMediaPlayerDemo
//
//  Created by hanbobiao on 10/12/15.
//  Copyright (c) 2015 西安天睿软件有限责任公司. All rights reserved.
//

#ifndef CBBMediaPlayerDemo_CBBDataStructureConstant_h
#define CBBMediaPlayerDemo_CBBDataStructureConstant_h

#define CBB_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define CBB_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

enum ViewTagType {
    
    ViewBtnStart = 1,
    ViewBtnStop,
    ViewBtnStream,
    ViewBtnGetLens,
    ViewBtnGetVersion,
    ViewBtnSetLens,
    ViewBtnSetWhiteBalance,
    ViewBtnSetTime,
    ViewBtnFirmware,
    
};

enum RestorePlayType {
    RestoreDefaultPlay = 1,
    RestoreOnLinePlay,
    RestoreLocalPlay
};

#endif
