//
//  ZGiReaderReadUtilites.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/2.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderReadUtilites.h"
#import "JJPreventCrash.h"


@implementation ZGiReaderReadUtilites
+(NSString *)encodeWithURL:(NSURL *)url
{
    if (!url) {
        return @"";
    }
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    if (!content) {
        content = [NSString stringWithContentsOfURL:url encoding:0x80000632 error:nil];
    }
    if (!content) {
        content = [NSString stringWithContentsOfURL:url encoding:0x80000631 error:nil];
    }
    if (!content) {
        return @"";
    }
    return jjString(content);
    
}

+ (NSArray<ZGiReaderChapterModel *> *)returnFilterSplitContentText:(NSString *)text
{
        __block NSMutableArray * arrayM = [NSMutableArray array];
        NSString *parten = @"[第][0-9一二三四五六七八九十百千万]{1,5}[章回节]{1,2}[^\n]{1,}";//@"第[0-9一二三四五六七八九十百千]*[章回].*";
        NSError* error = NULL;
        NSRegularExpression *reg = [NSRegularExpression regularExpressionWithPattern:parten options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSArray* match = [reg matchesInString:text options:NSMatchingReportCompletion range:NSMakeRange(0, [text length])];
        
        if (match.count != 0)
        {
            __block NSRange lastRange = NSMakeRange(0, 0);
            [match enumerateObjectsUsingBlock:^(NSTextCheckingResult *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSRange range = [obj range];
                NSInteger local = range.location;
                if (idx == 0) {
                    
                    NSString * title = @"福利";
                    NSUInteger len = local;
                    NSString * cont = [text substringWithRange:NSMakeRange(0, len)];
                    NSLog(@"章节名1--%@",title);
                    NSLog(@"内容1--%@",cont);
                    
                    
                    ZGiReaderChapterModel * model = [[ZGiReaderChapterModel alloc] init];
                    model.title = jjString(title);
                    model.chapterContent = jjString(cont);
                    arrayM = [JJPreventCrash jjAddObjectWithArrayM:arrayM addObject:model];
                    
                }
                if (idx > 0 ) {
                    
                    NSLog(@"章节名2--%@",[text substringWithRange:lastRange]);
                    NSUInteger len = local-lastRange.location;
                    NSLog(@"内容2--%@",[text substringWithRange:NSMakeRange(lastRange.location, len)]);
                    
                    
                   // NSDictionary * dict = @{@"title":,@"content":jjString([text substringWithRange:NSMakeRange(lastRange.location, len)])};
                    
                    ZGiReaderChapterModel * model = [[ZGiReaderChapterModel alloc] init];
                    model.title = jjString([text substringWithRange:lastRange]);
                    model.chapterContent = jjString([text substringWithRange:NSMakeRange(lastRange.location, len)]);
                    arrayM = [JJPreventCrash jjAddObjectWithArrayM:arrayM addObject:model];
                }
                if (idx == match.count-1) {
                    
                    NSLog(@"章节名3--%@",[text substringWithRange:range]);
                    
                    NSLog(@"内容3--%@",[text substringWithRange:NSMakeRange(local, text.length-local)]);
                    
              
                    
                    ZGiReaderChapterModel * model = [[ZGiReaderChapterModel alloc] init];
                    model.title = jjString([text substringWithRange:range]);
                    model.chapterContent = jjString([text substringWithRange:NSMakeRange(local, text.length-local)]);
                    arrayM = [JJPreventCrash jjAddObjectWithArrayM:arrayM addObject:model];
                }
                lastRange = range;
            }];
        }
        else{
            NSLog(@"内容4--%@",text);
        }
    
    
    
    return arrayM;
}



+(NSArray<ZGiReaderChapterModel *> *)encodeReturnFilterSplitContentTextWithURL:(NSURL *)url
{
  
   return [self returnFilterSplitContentText:[self encodeWithURL:url]];
    
}

@end
