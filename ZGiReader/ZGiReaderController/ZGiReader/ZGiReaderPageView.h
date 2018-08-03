//
//  ZGiReaderPageView.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGiReaderPageView : UIView
@property (nonatomic, copy) NSAttributedString *attributedText;

- (void)setText:(NSAttributedString *)attributedText;
@end
