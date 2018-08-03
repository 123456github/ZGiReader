//
//  ZGiReaderViewController.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/7/26.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGBaseViewController.h"
#import "ZGiReaderGlobalModel.h"

@interface ZGiReaderViewController : ZGBaseViewController
@property (strong, nonatomic) ZGiReaderGlobalModel *globalModel;
@property (nonatomic, strong) NSDictionary *attributes;


/**
 当前章节要展示的内容

 @param text 当前章节内容
 */
- (void)loadText:(NSString *)text;
@end
