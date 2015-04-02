//
//  XXBZoomView.m
//  XXBZoomView
//
//  Created by 杨小兵 on 15/4/2.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "XXBZoomView.h"

@implementation XXBZoomView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setupZoomView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupZoomView];
    }
    return self;
}
- (void)setupZoomView
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    self.scale = 2.0;
    self.dragingEnabled = YES;
    UIPanGestureRecognizer* pgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:pgr];
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, (self.frame.size.width / 2), (self.frame.size.height / 2));
    CGContextScaleCTM(context, self.scale, self.scale);
    CGContextTranslateCTM(context, -(self.frame.origin.x) - (self.frame.size.width / 2), -(self.frame.origin.y) - (self.frame.size.height / 2));
    [self setHidden:YES];
    [self.superview.layer.superlayer renderInContext:context];
    [self setHidden:NO];
}
- (void)handlePan:(UIPanGestureRecognizer*)pgr;
{
    if (pgr.state == UIGestureRecognizerStateChanged)
    {
        CGPoint center = pgr.view.center;
        CGPoint translation = [pgr translationInView:pgr.view];
        center = CGPointMake(center.x + translation.x,
                             center.y + translation.y);
        pgr.view.center = center;
        [pgr setTranslation:CGPointZero inView:pgr.view];
        [self setNeedsDisplay];
    }
}
- (void)setZoomScale:(CGFloat)scale
{
    _scale = scale;
    [self setNeedsDisplay];
}
- (void)setDragingEnabled:(BOOL)enabled
{
    [self setUserInteractionEnabled:enabled];
}
@end
