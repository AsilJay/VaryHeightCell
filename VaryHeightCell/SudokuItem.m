//
//  SudokuItem.m
//  SudukuTest
//
//  Created by myjawdrops on 16/12/7.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "SudokuItem.h"

@implementation SudokuItem

- (instancetype)initWithCustumView:(UIView *)customView{
    return (SudokuItem *)customView;
}

- (instancetype)initWithImageName:(NSString *)imageName highLighted:(NSString *)highLightedName{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *highLighted = [UIImage imageNamed:highLightedName];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image highlightedImage:highLighted];
    imgView.userInteractionEnabled = YES;
    return [[SudokuItem alloc] initWithCustumView:imgView];
}

@end
