//
//  ZGiReaderPageCell.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZGiReaderPageView.h"

static NSString *PageCellIdentifier = @"PageCellIdentifier";
@interface ZGiReaderPageCell : UICollectionViewCell
@property (nonatomic, strong) ZGiReaderPageView *pageView;
@end
