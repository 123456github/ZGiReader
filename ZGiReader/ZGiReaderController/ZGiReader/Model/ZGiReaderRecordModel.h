//
//  ZGiReaderRecordModel.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/2.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGiReaderRecordModel : NSObject<NSCopying,NSCoding>
@property (nonatomic,strong) NSString * contentString;
//@property (nonatomic,strong) ZGiReaderRecordModel *chapterModel;  //阅读的章节
//@property (nonatomic) NSUInteger page;  //阅读的页数
//@property (nonatomic) NSUInteger chapter;    //阅读的章节数
//@property (nonatomic) NSUInteger chapterCount;  //总章节数
@end
