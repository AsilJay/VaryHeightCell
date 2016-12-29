//
//  JJSudoku.h
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/7.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SudokuItem.h"
@class JJSudoku;

#define kScreenW [UIScreen mainScreen].bounds.size.width

typedef void(^SelectedItemBlock)(JJSudoku *sudoku, NSInteger index);

@interface JJSudoku : UIView

@property (assign, nonatomic) NSInteger numberOfItems;
@property (strong, nonatomic)   NSArray *items;
@property (nonatomic,assign)  SelectedItemBlock selectedItem;


+ (CGSize)sizeWithItemCount:(NSInteger)itemCount;


- initWithItems:(NSArray *)items;
- (void)addItem:(SudokuItem *)item;



@end
