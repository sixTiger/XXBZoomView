//
//  XXBZoomView.h
//  XXBZoomView
//
//  Created by 杨小兵 on 15/4/2.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXBZoomView : UIView
/**
 *  是否允许拖拽
 */
@property(nonatomic , assign)BOOL dragingEnabled;
/**
 *  缩放比例
 */
@property(nonatomic , assign)CGFloat scale;
@end
