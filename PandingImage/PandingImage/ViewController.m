//
//  ViewController.m
//  PandingImage
//
//  Created by moxuyou on 16/6/19.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+LXHPandingImage.h"

@interface ViewController ()

@property (nonatomic , assign)CGPoint startP;
@property (nonatomic , weak)UIView *HUDView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (UIView *)HUDView
{
    if (_HUDView == nil) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.6;
        _HUDView = view;
        [self.view addSubview:view];
    }
    return _HUDView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panding:)];
    
    [self.imageView addGestureRecognizer:pan];
}

- (void)panding:(UIPanGestureRecognizer *)pan
{
    CGPoint panP = [pan locationInView:self.imageView];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.startP = panP;
        
    }
    [UIImage imageViewPanding:pan HUDView:self.HUDView imageView:self.imageView Point:self.startP];
    
    
}

@end
