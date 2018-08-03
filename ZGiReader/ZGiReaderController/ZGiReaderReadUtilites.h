//
//  ZGiReaderReadUtilites.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/2.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGiReaderChapterModel.h"

@interface ZGiReaderReadUtilites : NSObject
+(NSString *)encodeWithURL:(NSURL *)url;

/**
 过滤拆分内容，适用于从网上下载的全本小说，通过分成章节。快速展示

 @param text 要过滤拆分的内容
 @return 返回过滤好的每一个章节数组
 */
+ (NSArray<ZGiReaderChapterModel *> *)returnFilterSplitContentText:(NSString *)text;



/**
 过滤拆分内容，适用于从网上下载的全本小说，通过分成章节。快速展示

 @param url 本地路径
 @return 返回过滤好的每一个章节数组
 */
+(NSArray<ZGiReaderChapterModel *> *)encodeReturnFilterSplitContentTextWithURL:(NSURL *)url;
@end
