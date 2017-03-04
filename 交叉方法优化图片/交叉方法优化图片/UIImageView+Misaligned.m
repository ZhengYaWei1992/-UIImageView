//
//  UIImageView+Misaligned.m
//  交叉方法优化图片
//
//  Created by 郑亚伟 on 2017/3/3.
//  Copyright © 2017年 zhengyawei. All rights reserved.
//

#import "UIImageView+Misaligned.h"
#import <objc/runtime.h>

@implementation UIImageView (Misaligned)

//在类被加载到运行时的时候，就会执行
+ (void)load{
    //方法都是定义在类里面，所以获取方法以Class开头
    //获取类方法  参一：获取那个类的方法  参二：获取方法编号，根据SEL找到类对应的方法
    Method originalMethod = class_getInstanceMethod([self class], @selector(setImage:));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(zw_setImage:));
    //交换方法的实现
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

//自定义的和系统方法交换
- (void)zw_setImage:(UIImage *)image{
    //第三个参数是分辨率  如果设置为0，会根据设备自动设置图片分辨率
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    //绘制图像
    [image drawInRect:self.bounds];
    //获取结果
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //调用系统默认的设置图片的方法，即已经交换过自己写的方法
    [self zw_setImage:result];
}



@end
