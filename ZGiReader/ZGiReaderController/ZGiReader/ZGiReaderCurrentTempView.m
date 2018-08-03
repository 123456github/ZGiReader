//
//  ZGiReaderCurrentTempView.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/2.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderCurrentTempView.h"
#import "ZGiReaderHeader.h"

@interface ZGiReaderCurrentTempView()

@property (nonatomic, assign) CGRect iFrame;

@end

@implementation ZGiReaderCurrentTempView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.pageView];
        self.iFrame = frame;
        self.pageView.frame = CGRectMake(offSet_x, 0, frame.size.width - 2 * offSet_x, frame.size.height);//self.contentView.bounds;
        
        //        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_pageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageView)]];
        //        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_pageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_pageView)]];
        //  self.contentView.backgroundColor = [UIColor yellowColor];
        
        //     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RollingModeUpdateMargin) name:@"RollingModeUpdateMargin" object:nil];
    }
    return self;
}


//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
////    if (_interactionLocked)
////        return;
////
////    UITouch *touch = [event.allTouches anyObject];
////    _touchBeganPoint = [touch locationInView:self];
////
////    if ([self touchedPrevPage] && [self hasPrevPage]) {
////        [CATransaction begin];
////        [CATransaction setValue:(id)kCFBooleanTrue
////                         forKey:kCATransactionDisableActions];
////
////        self.currentPageIndex = self.currentPageIndex - _numberOfVisiblePages;
////        self.leafEdge = 0.0;
////        [CATransaction commit];
////        _touchIsActive = YES;
////    }
////    else if ([self touchedNextPage] && [self hasNextPage])
////        _touchIsActive = YES;
////
////    else
////        _touchIsActive = NO;
//}
////
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
////    if (!_touchIsActive)
////        return;
////    UITouch *touch = [event.allTouches anyObject];
////    CGPoint touchPoint = [touch locationInView:self];
////
////    [CATransaction begin];
////    [CATransaction setValue:[NSNumber numberWithFloat:0.07]
////                     forKey:kCATransactionAnimationDuration];
////    self.leafEdge = touchPoint.x / self.bounds.size.width;
////    [CATransaction commit];
//}
//
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
////    if (!_touchIsActive)
////        return;
////    _touchIsActive = NO;
////
////    UITouch *touch = [event.allTouches anyObject];
////    CGPoint touchPoint = [touch locationInView:self];
////    BOOL dragged = distance(touchPoint, _touchBeganPoint) > [self dragThreshold];
////
////    [CATransaction begin];
////    float duration;
////    if ((dragged && self.leafEdge < 0.5) || (!dragged && [self touchedNextPage])) {
////        [self willTurnToPageAtIndex:_currentPageIndex + _numberOfVisiblePages];
////        self.leafEdge = 0;
////        duration = _leafEdge;
////        _interactionLocked = YES;
////        if (_currentPageIndex+2 < _numberOfPages && _backgroundRendering)
////            [_pageCache precacheImageForPageIndex:_currentPageIndex+2];
////        [self performSelector:@selector(didTurnPageForward)
////                   withObject:nil
////                   afterDelay:duration + 0.25];
////    }
////    else {
////        [self willTurnToPageAtIndex:_currentPageIndex];
////        self.leafEdge = 1.0;
////        duration = 1 - _leafEdge;
////        _interactionLocked = YES;
////        [self performSelector:@selector(didTurnPageBackward)
////                   withObject:nil
////                   afterDelay:duration + 0.25];
////    }
////    [CATransaction setValue:[NSNumber numberWithFloat:duration]
////                     forKey:kCATransactionAnimationDuration];
////    [CATransaction commit];
//}





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
        _pageView.backgroundColor = ZGiReader_backgroundColor;
    }
    return _pageView;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
