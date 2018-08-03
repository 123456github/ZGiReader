//
//  Header.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#ifndef Header_h
#define Header_h


#import "JJPreventCrash.h"



#define K_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define K_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define NavigationBar_Height  ([[UIApplication sharedApplication] statusBarFrame].size.height + 44)//导航栏加状态栏高度
#define offSet_x 10//[E_CommonManager margin]//暂时写死
#define offSet_y 30//([ZGiReaderAppInfoManager iPhoneMachineName] ? 54:30)//暂时写死
#define label_Height 30
#define ZGiReader_edge_10 10//边缘宽度

#define ZGiReaderTopAndBottomBar_BottomViewHeight 60



#define ZGiReader_pageView_Width (K_SCREEN_WIDTH - offSet_x * 2)//每一页的宽
#define ZGiReader_pageView_Height ( K_SCREEN_HEIGHT - offSet_y - label_Height)//每一页的高
#define ZGiReader_pageView_Size CGSizeMake(ZGiReader_pageView_Width, ZGiReader_pageView_Height)//每一页的大小
#define ZGiReader_pageView_Frame CGRectMake(offSet_x, offSet_y,ZGiReader_pageView_Width,ZGiReader_pageView_Height)

#define ZGiReader_backgroundColor [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]

#define ZGiReader_ThemeFontColor [UIColor colorWithRed:30/255.0 green:123/255.0 blue:94/255.0 alpha:1.0f]//主体颜色
#define ZGiReader_ContentFontColor [UIColor blackColor]

#define zgRc4randomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];


#define ZGiReader_afterDelay 0.3


#endif /* Header_h */




