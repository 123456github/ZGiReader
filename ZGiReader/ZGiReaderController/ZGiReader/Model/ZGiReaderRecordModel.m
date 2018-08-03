//
//  ZGiReaderRecordModel.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/2.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderRecordModel.h"

@implementation ZGiReaderRecordModel
-(id)copyWithZone:(NSZone *)zone
{
    ZGiReaderRecordModel *recordModel = [[ZGiReaderRecordModel allocWithZone:zone]init];
    recordModel.contentString = self.contentString;
//    recordModel.chapterModel = [self.chapterModel copy];
//    recordModel.page = self.page;
//    recordModel.chapter = self.chapter;
    return recordModel;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.contentString forKey:@"contentString"];
//    [aCoder encodeInteger:self.page forKey:@"page"];
//    [aCoder encodeInteger:self.chapter forKey:@"chapter"];
//    [aCoder encodeInteger:self.chapterCount forKey:@"chapterCount"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.contentString = [aDecoder decodeObjectForKey:@"contentString"];
//        self.page = [aDecoder decodeIntegerForKey:@"page"];
//        self.chapter = [aDecoder decodeIntegerForKey:@"chapter"];
//        self.chapterCount = [aDecoder decodeIntegerForKey:@"chapterCount"];
    }
    return self;
}
@end
