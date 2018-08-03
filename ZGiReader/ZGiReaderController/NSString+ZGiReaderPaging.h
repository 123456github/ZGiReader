//
//  NSString+ZGiReaderPaging.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ZGiReaderPaging)
- (NSArray *)paginationWithAttributes:(NSDictionary *)attributes constrainedToSize:(CGSize)size;

- (NSString *)halfWidthToFullWidth;
@end
