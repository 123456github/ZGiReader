//
//  ZGiReaderCollectionViewFlowLayout.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderCollectionViewFlowLayout.h"

@implementation ZGiReaderCollectionViewFlowLayout
- (void)prepareLayout
{
    self.itemSize = CGSizeMake(K_SCREEN_WIDTH, K_SCREEN_HEIGHT);
    //水平滑动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //上左下右四个偏移量
    self.sectionInset = UIEdgeInsetsMake(0,0,0,0);
    //每个cell之间的间距
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    
}
@end
