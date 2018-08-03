//
//  ZGiReaderGlobalModel.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *kUpdatePageNotification = @"kUpdatePageNotification";
@interface ZGiReaderGlobalModel : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSMutableArray *rangeArray;
@property (nonatomic, strong) NSDictionary *attributes;
@property (nonatomic,assign) CGFloat fontSize;
@property (nonatomic,assign) int lineSpace;
@property (nonatomic,assign) CGFloat marginSpace;//页边距
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSRange currentRange;     //尚未使用
@property (nonatomic,strong)UIColor *bgColor;


+ (instancetype)shareModel;

- (void)loadText:(NSString *)text completion:(void(^)(void))completion;

- (void)updateFontCompletion:(void(^)(void))completion;
@end
