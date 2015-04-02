//
//  ViewController.m
//  XXBZoomView
//
//  Created by 杨小兵 on 15/4/2.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "ViewController.h"
#import "XXBZoomView.h"

@interface ViewController ()
@property(nonatomic , weak)XXBZoomView *zoomView;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    XXBZoomView * zoomView = [[XXBZoomView alloc] initWithFrame:CGRectMake(10, 20, 150, 150)];
    zoomView.scale = 2.0;
    zoomView.dragingEnabled = YES;
    [zoomView.layer setBorderColor:[UIColor blackColor].CGColor];
    [zoomView.layer setBorderWidth:1.0];
    [zoomView.layer setCornerRadius:75];
    [self.view addSubview:zoomView];
    _zoomView = zoomView;
}
@end
