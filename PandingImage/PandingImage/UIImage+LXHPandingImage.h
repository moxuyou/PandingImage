//
//  UIImage+LXHPandingImage.h
//  day6-屏幕截图分类
//
//  Created by moxuyou on 16/5/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LXHPandingImage)

+ (void)imageViewPanding:(UIPanGestureRecognizer *)pan HUDView:(UIView *)HUDView imageView:(UIImageView *)imageView Point:(CGPoint)startPoint;

@end
