//
//  ViewController.m
//  交叉方法优化图片
//
//  Created by 郑亚伟 on 2017/3/3.
//  Copyright © 2017年 zhengyawei. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //运行这段代码，然后在模拟器中点击Debug-->Color Misaligned Color。不出现以外的话会发现图像呈现为谈黄色，这是因为图片在UIImageView上做了拉升，这种拉伸一般都会影响程序的性能。一般的解决方案就是通过CoreGraphic核心绘图这个框架，重新绘制图片，绘制的图片尺寸大小和UIImageView的尺寸大小完全一致，就能达到优化程序的目的。常规做法可能就是封装一个方法，传入图片名、UIImageView的frame，然后返回一张图片。但是这里我并不打算这样做，我的主要目的是：不改写以下代码，只需要简单的拖入一个文件，就连头文件都不用导入，就能达到优化解决图片拉升优化程序的目的。
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"美女16.jpg"];
    [self.view addSubview:imageView];
    
    //主要实现是通过运行时，交换方法。
}

@end
