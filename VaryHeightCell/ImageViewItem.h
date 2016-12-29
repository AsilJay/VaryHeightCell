//
//  ImageViewItem.h
//  STeBook
//
//  Created by apple on 15/6/12.
//  Copyright (c) 2015年 rain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectImageBlock)(NSURL *url, UIImage *image, NSInteger index);

@interface ImageViewItem : UIImageView

@property (strong, nonatomic) NSURL *bigPicUrl; // 大图Url
@property (strong, nonatomic) NSURL *smallPicUrl; // 小图Url
@property (strong, nonatomic) UIImage *localImage;
@property (assign, nonatomic) NSInteger index;

@property (copy, nonatomic) selectImageBlock selectImage;

- (void) loadImage;

@end
