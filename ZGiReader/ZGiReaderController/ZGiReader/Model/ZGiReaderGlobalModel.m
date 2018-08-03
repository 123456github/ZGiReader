//
//  ZGiReaderGlobalModel.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderGlobalModel.h"
#import "ZGiReaderHeader.h"
#import "NSString+ZGiReaderPaging.h"

@implementation ZGiReaderGlobalModel
+ (instancetype)shareModel
{
    static ZGiReaderGlobalModel *model = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        model = [[ZGiReaderGlobalModel alloc] init];
    });
    return model;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
       // self.fontSize = 18;
    }
    return self;
}

- (void)loadText:(NSString *)text completion:(void (^)(void))completion
{
    self.text = text;
    [self pagingTextCompletion:completion];
}

- (void)pagingTextCompletion:(void (^)(void))completion
{
    NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithCapacity:5];
    UIFont * font = [UIFont systemFontOfSize:self.fontSize];
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:@(1.0) forKey:NSKernAttributeName];
    [attributes setValue:@(1.0) forKey:NSKernAttributeName];
   // UIColor *color = [E_CommonManager color];//颜色暂时去掉
    //[attributes setValue:color forKey:NSForegroundColorAttributeName];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = self.lineSpace;//行距
    //  paragraphStyle.paragraphSpacing = 0.0;//段距
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    self.attributes = [attributes copy];
    self.rangeArray = [[self.text paginationWithAttributes:self.attributes constrainedToSize:ZGiReader_pageView_Size] mutableCopy];//每一页的大小
    if (completion) {
        completion();
    }
}

- (void)updateFontCompletion:(void (^)(void))completion
{
    //取回之前的定位页数
    NSRange range = self.currentRange;
    [self pagingTextCompletion:^{
        //重新定位页码
        [self.rangeArray enumerateObjectsUsingBlock:^(NSString *rangeStr, NSUInteger idx, BOOL *stop) {
            NSRange tempRange = NSRangeFromString(rangeStr);
            if (tempRange.location <= range.location && tempRange.location + tempRange.length > range.location) {
                self.currentPage = idx;
                *stop = YES;
            }
        }];
        if (completion) {
            completion();
        }
    }];
}

//- (void)setFontSize:(CGFloat)fontSize
//{
//    if (fontSize < 14.0) {
//        _fontSize = 14.0;
//    } else if (fontSize > 30.0) {
//        _fontSize = 30.0;
//    } else {
//        _fontSize = fontSize;
//    }
//}

-(void)setLineSpace:(int)lineSpace
{
    _lineSpace = lineSpace;
    //    if (lineSpace) {
    //        <#statements#>
    //    }
}

- (void)setCurrentRange:(NSRange)currentRange
{
    _currentRange = currentRange;
    NSLog(@"%@", NSStringFromRange(_currentRange));
}

@end
