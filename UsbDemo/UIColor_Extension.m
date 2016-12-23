//
//  UIColor_Extension.m
//  Familie
//
//  Created by Xue on 15/3/30.
//  Copyright (c) 2015年 skylight. All rights reserved.
//

#import "UIColor_Extension.h"

@implementation UIColor(Extensions)
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}



@end
