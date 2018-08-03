//
//  ZGiReaderPageCell.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderPageCell.h"
#import "ZGiReaderHeader.h"
@interface ZGiReaderPageCell()

@property (nonatomic, assign) CGRect iFrame;

@end

@implementation ZGiReaderPageCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.pageView];
        self.iFrame = frame;
        
        
        
        self.pageView.frame = ZGiReader_pageView_Frame;//ZGiReader_pageView_Size;
        
        //        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_pageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageView)]];
        //        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_pageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageView)]];
        //  self.contentView.backgroundColor = [UIColor yellowColor];
        
   //     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RollingModeUpdateMargin) name:@"RollingModeUpdateMargin" object:nil];
    }
    
    return self;
}

- (void)RollingModeUpdateMargin
{
    self.pageView.frame = CGRectMake(offSet_x, 0, self.iFrame.size.width - 2 * offSet_x, self.iFrame.size.height);
}
#pragma mark - lazy loading

- (ZGiReaderPageView *)pageView
{
    if (!_pageView) {
        _pageView = [[ZGiReaderPageView alloc] init];
        _pageView.translatesAutoresizingMaskIntoConstraints = NO;
        _pageView.backgroundColor = zgRc4randomColor;//ZGiReader_backgroundColor;
    }
    return _pageView;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
