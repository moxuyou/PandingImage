//
//  UIImage+LXHPandingImage.m
//  day6-屏幕截图分类
//
//  Created by moxuyou on 16/5/17.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "UIImage+LXHPandingImage.h"

@implementation UIImage (LXHPandingImage)


+ (void)imageViewPanding:(UIPanGestureRecognizer *)pan HUDView:(UIView *)HUDView imageView:(UIImageView *)imageView Point:(CGPoint)startPoint
{
    CGPoint panP = [pan locationInView:imageView];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        startPoint = panP;
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        CGFloat x = startPoint.x;
        CGFloat y = startPoint.y;
        CGFloat w = panP.x - startPoint.x;
        CGFloat h = panP.y - startPoint.y;
        HUDView.frame = CGRectMake(x, y, w, h);
        
    }else if (pan.state == UIGestureRecognizerStateEnded){
        [HUDView removeFromSuperview];
        
        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, NO, 0.0);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:HUDView.frame];
        [path addClip];
        [imageView.layer renderInContext:ctx];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        imageView.image = image;
        UIGraphicsEndImageContext();
    }
}



@end
