//
//  ZGiReaderAppInfoManager.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderAppInfoManager.h"
#import <UIKit/UIKit.h>
#import "ZGiReaderHeader.h"
@implementation ZGiReaderAppInfoManager

+ (BOOL)iPhoneMachineName
{
    if (K_SCREEN_HEIGHT == 812) {
        return YES;
    }else{
        return NO;
    }
}
@end
