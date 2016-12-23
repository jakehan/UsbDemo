//
//  Macors.h
//  Familie
//
//  Created by Xue on 15/1/23.
//  Copyright (c) 2015年 skylight. All rights reserved.
//

#ifndef Familie_Header_h
#define Familie_Header_h


#endif


#define kNavigationBarHeight ((IOS_VERSION >= 7.0) ? (64.f) : (44.f))
#define kTabBarHeight        55.0f

// 屏幕尺寸
#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

// 视图尺寸
#define FrameX(frame)  frame.origin.x
#define FrameY(frame)  frame.origin.y
#define Width(frame)   frame.size.width
#define Height(frame)  frame.size.height
#define Origin(frame)  frame.origin
#define Size(frame)    frame.size
#define MaxY(frame)    CGRectGetMaxY(frame)
#define MaxX(frame)    CGRectGetMaxX(frame)
#define MinX(frame)    CGRectGetMinX(frame)
#define MinY(frame)    CGRectGetMinY(frame)
#define CenterX(frame) (frame.size.width/2)
#define CenterY(frame) (frame.size.height/2)

// 路径
#define PATH_HOME        NSHomeDirectory()
#define PATH_TEMPORARY   NSTemporaryDirectory()
#define PATH_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// UIColor RGB
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]
#define CLOR(A,B,C,D) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:D]


#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 \
green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
blue:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
alpha:((float)(rgbValue & 0xFF))/255.0]

//background
#define CELL_BG_COLOR       CLOR(0x05,0x4a, 0x75,0.2)
#define CELL_BG_H_COLOR     CLOR(0x05,0x4a, 0x75,1.0)
#define CELL_MARGIN_COLOR   RGB(31, 156, 203)
#define CELL_HEAD_COLOR     CLOR(32, 70, 92, 1.0)

#define TABAR_BG_COLOR      UIColorFromRGB(0x2C5E7E)

#define MESSAGE_TOP_COLOR   UIColorFromRGB(0x28638d)

// 定义空字符串
#define EMPTY_STRING @""
#define NotNullString(x)       ((x) ? (x) : (@""))

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define HEIGHT_DEVIATION (IOS_VERSION >= 7.0)?0:0

//sql语句中 升序
#define SQL_ORDER_ASC @"asc"
//sql语句中 降序
#define SQL_ORDER_DESC @"desc"


#define CURRENT_USER @""

#define CustomPartVersion

//#define STREAM_PLAY_RTP_PACKET

//#define UID @"167"
//#define RANDOM @"3b88ba79714c6e0b"
//#define UID @"256"
//#define RANDOM @"fb83f6ff0c870fe0"

//#define UID @"257"
//#define RANDOM @"bff0e3d46b3bba62"


typedef enum{
    playStreamWithuPNP,           // 1 通过UNNP播放
    playStreamWithStunP2P,        // 2 通过p2p打洞播放
    playStreamWithCloudRelayURL   // 3 通过云端转发播放
}PlayStreamType;

typedef enum {
    NavigateBarTypeNormal = 0,
    NavigateBarTypePullDown = 1,
    NavigateBarTypeBack,
    NavigateBarTypeRight,
    NavigateBarTypeLeftandRight
}NavigateBarType;

typedef enum {
    CameraStateTypeOffline = 0,
    CameraStateTypeOnline = 1,
    CameraStateTypeStandby = 2
}CameraStateType;

// 摄像头类型
typedef enum {
    CameraTypeBaby =0,    //婴儿摄像头
    CameraTypeSenior,     //老人摄像头
    CameraTypeFamily,     //家庭摄像头
    CameraTypePet,        //宠物摄像头
    CameraTypeDoor        //门禁摄像头
}CameraType;

#define     CameraBabyName       @"Baby Camera"
#define     CameraElderName      @"Elder Camera"
#define     CameraFamilyName     @"Family Camera"
#define     CameraPetName        @"Pet Camera"


#define     urlWithHttpSuffix    @"live.m3u8"       //基于http url uPNP后缀
#define     urlWithRtspSuffix    @"stream0"         //基于rtsp url uPNP后缀

//请求成功
#define HTTP_OPERATION_SUCCEED   0
//请求错误
#define HTTP_OPERATION_ERROR     1
//请求失败
#define HTTP_OPERATION_FAILED    2


#define FEED_DEBUG_TEST

#ifdef DEBUG
//#define ROOT_IP @"192.168.142.164"
//#else
//#define ROOT_IP @"192.168.142.164"
#define ROOT_IP @"54.222.200.138"
#else
#define ROOT_IP @"54.222.200.138"
//#define ROOT_IP @"54.186.230.171"
//#else
//#define ROOT_IP @"54.186.230.171"

#endif



//局域网服务器地址
#ifdef DEBUG
#define ROOT_URL @"http://"ROOT_IP@":8080/sklcloud"
#else
#define ROOT_URL @"http://"ROOT_IP@":8080/sklcloud"
#endif



//亚马逊服务器地址
//#ifdef DEBUG
//#define ROOT_URL @"http://cloud.developer.skli.biz:8888/sklcloud"
//#else
//#define ROOT_URL @"http://cloud.developer.skli.biz:8888/sklcloud"
//#endif
//
//#ifdef DEBUG
//#define ROOT_IP @"cloud.developer.skli.biz"
//#else
//#define ROOT_IP @"cloud.developer.skli.biz"
//#endif

//注册URI：
#define REGISTURL1 @"/skl-cloud/App/Security/AAA/users"

//登录URI：
#define SIGNURL1 @"/Security/AAA/users/"

//用户登出URI:
#define LOGOUT1 @"/Security/AAA/users/<userId>"

#define KHEART @"/skl-cloud/app/Security/AAA/users/heartBeat"

//获取用户设备数量
#define GETCAMERACOUNT @"/skl-cloud/app/queryDevicesCount"

//!!!!!!!!!!!!!!!!!获取用户设备信息列表
#define GETCAMERAINFOLIST @"/skl-cloud/app/queryRelatedDevices"
//queryRelatedDevices

//获取设备状态
#define GETCAMERASTATE @"/skl-cloud/app/queryDevicesP2p"

//获取设备实时图片
#define GETCAMERAPIC @"/skl-cloud/app/streaming/queryDevicesPicture"

//获取视频直播Relay的URL
#define GETVIDEORELAYURL @"/skl-cloud/app/streaming/snDevice/live"

//获取设备Replay
#define GETCAMERAREPLAY @"/skl-cloud/app/streaming/snDevice/live"

//获取视频playback的URL
#define GETVIDEOPLAYBACKURL @""

//获取设备playback
#define GETCAMERAPLAYBACK @""

#define GET_IPC_DATA_PREFIX @"/skl-cloud/appremote/"

#define GET_IPC_CHANNELS @"/PSIA/Streaming/channels"

//获取P2P信息
#define GET_P2P_INFO @"/skl-cloud/app/queryP2PInfo"

//9.1	获取流通道列表APP-IPC
#define GET_TRAFFICFLOW_LIST @"/PSIA/Streaming/channels"

//3.10	获取流通道列表APP-Cloud
#define GET_TRAFFICFLOW_LIST_CLOUD @"/skl-cloud/appremote"

//9.6	获取streamURL(HLS)
#define GET_STREAMURL_HLSRTSP @"/PSIA/Streaming/channels"

//***************************************************************


//注册URL：
#define REGISTURL @"/skl-cloud/app/Security/AAA/users"

//登录URL：
#define SIGNURL @"/skl-cloud/app/Security/AAA/users/userId"


#warning 帮云端测试用的
//#define SIGNURL @"/skl-cloud/userController/isuser"

//用户登出URL:
#define LOGOUT @"/skl-cloud/app/Security/AAA/users/loginOut"

//重置密码URL:
#define RESETPWD @"/skl-cloud/app/Security/AAA/users/forgetPw"

//心跳包请求URL:
#define HEARTBEATURL  @"/skl-cloud/app/Security/AAA/users/heartBeat"

#define RESOURCE_URL @"/sklcloud/skl-cloud/app/Security/AAA/users/heartBeat"


//IPC注册  2.5
#define IPCREGISTER @"/skl-cloud/app/Security/AAA/users/deviceRegist"

//2.16 APP查询设备是否已被其他人关联  //查询IPC是否已经连上云端

#define ORNOTLIN @"/skl-cloud/app/device/"


//关联IPC设备
#define DEVICELINK @"/skl-cloud/app/Security/AAA/users/deviceLink"

#define DEVLIREMOVE @"/skl-cloud/app/Security/AAA/users/deviceLink/remove"

//上传图片成功确认
#define SPPCCON  @"/skl-cloud/app/user/file/upload/success/confirm.app"


//上传音乐成功确认
#define MUSICCON  @"/skl-cloud/app/device/file/upload/success/confirm.app"

#define FBANDGOOGLEURI @"/skl-cloud/app/Security/AAA/users/thirdId"
