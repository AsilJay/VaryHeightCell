//
//  NSString+holdSize.h
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/6.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (holdSize)

/*
 若size.width ==0 height!=0 表示高度固定
 若size.width !=0 height==0 表示宽度固定
 若都等于0  表示宽高都不固定（少数字符串占位大小）
 */
- (CGSize)holdSizeWithFontSize:(CGFloat)fontSize bounding:(CGSize)size;

@end
