//
//  SudokuItem.h
//  SudukuTest
//
//  Created by myjawdrops on 16/12/7.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SudokuItem : UIView

- (instancetype)initWithCustumView:(UIView *)customView;
- (instancetype)initWithImageName:(NSString *)imageName highLighted:(NSString *)highLightedName;

@end
