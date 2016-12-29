//
//  NSString+holdSize.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/6.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "NSString+holdSize.h"

@implementation NSString (holdSize)

- (CGSize)holdSizeWithFontSize:(CGFloat)fontSize bounding:(CGSize)size{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGFloat sizeW = size.width,sizeH = size.height;
    if (sizeW == 0) {
        sizeW = MAXFLOAT;
    }
    if (sizeH == 0) {
        sizeH = MAXFLOAT;
    }
    
    CGSize holdSize = [self boundingRectWithSize:CGSizeMake(sizeW, sizeH) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attrs context:nil].size;
    
    return holdSize;
   
}
@end
