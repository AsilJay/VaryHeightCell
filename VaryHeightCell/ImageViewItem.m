//
//  ImageViewItem.m
//  STeBook
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 rain. All rights reserved.
//

#import "ImageViewItem.h"
#import "UIImageView+WebCache.h"

@interface ImageViewItem ()

@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;

@end

@implementation ImageViewItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setContentMode:UIViewContentModeScaleAspectFill];
        [self setUserInteractionEnabled:YES];
        [self setClipsToBounds:YES];
        
        [self addSubview:self.indicatorView];
        [self setBackgroundColor:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:242.0/255.0 alpha:1]];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClicked)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setSmallPicUrl:(NSURL *)smallPicUrl
{
    _smallPicUrl = smallPicUrl;
    
    [self.indicatorView setCenter:self.center];
    [self.indicatorView startAnimating];
    [self sd_setImageWithURL:smallPicUrl placeholderImage:[UIImage imageNamed:@""] options:SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self.indicatorView stopAnimating];
    }];
}

- (void) setBigPicUrl:(NSURL *)bigPicUrl
{
    _bigPicUrl = bigPicUrl;
    
//    if (self.localImage) {
//        [self setImage:self.localImage];
//    }else{
//        [self sd_setImageWithURL:bigPicUrl placeholderImage:[UIImage imageNamed:@"ios152"] options:SDWebImageLowPriority];
//    }
}

- (void)setLocalImage:(UIImage *)localImage
{
    _localImage = localImage;
}

- (void) loadImage
{
    [self setImage:self.localImage];
}

- (void) imageClicked
{
    self.selectImage(self.bigPicUrl, self.localImage, self.index);
}

#pragma mark 懒加载indicatorView
- (UIActivityIndicatorView *)indicatorView
{
    if(_indicatorView == nil){
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _indicatorView;
}

@end
