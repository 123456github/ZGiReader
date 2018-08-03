//
//  ZGiReaderPageView.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/1.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderPageView.h"
#import <CoreText/CoreText.h>

@implementation ZGiReaderPageView
- (void)setText:(NSAttributedString *)attributedText
{
    
    
    self.attributedText = attributedText;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    CGAffineTransform transform = CGAffineTransformMake(1,0,0,-1,0,self.bounds.size.height);
    CGContextConcatCTM(context, transform);
    
    //    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    //    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFramesetterRef childFramesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRect:rect];
    CTFrameRef frame = CTFramesetterCreateFrame(childFramesetter, CFRangeMake(0, 0), bezierPath.CGPath, NULL);
    CTFrameDraw(frame, context);
   // CFRelease(frame);
 //   CFRelease(childFramesetter);
    // self.backgroundColor = [UIColor redColor];
}
@end
