//
//  JJSudoku.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/7.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "JJSudoku.h"

#define kMargin 10
#define kItemWH (kScreenW - 20 - 4*kMargin)/3

#define kMaxCountForRow 3
#define kMaxItemCount   9


@implementation JJSudoku



- (instancetype)initWithItems:(NSArray *)items{
    if (self = [super init]) {
        self.backgroundColor = [UIColor grayColor];
        self.items = items;
    }
    return self;
}

#pragma mark - tapGesture
- (void) tapGesture:(UITapGestureRecognizer *)tap{
    CGPoint point = [tap locationInView:self];
    for (int i = 1; i <= 9; i++) {
        NSLog(@"===========");
        int col = (i-1)%3 + 1;
        int row = (i-1)/3 + 1;
        CGRect rect = CGRectMake((col - 1)*(kMargin + kItemWH) + kMargin, (row - 1)*(kMargin + kItemWH), kItemWH, kItemWH);
        if ([self point:point isInRect:rect]) {
            self.selectedItem(self,i);
            return;
        }
    }
}

- (BOOL)point:(CGPoint)point isInRect:(CGRect)rect{
    if (point.x >= rect.origin.x && point.x <= CGRectGetMaxX(rect) && point.y >= rect.origin.y && point.y <= CGRectGetMaxY(rect)) {
        return YES;
    }
    return NO;
}

- (void)layoutSubviews{
    
    
    int row = 0;
    int col = 0;
    
    for (int i = 0; i < self.subviews.count; i++) {
        if (self.subviews.count == 4) {
            row = i/2 + 1;
            col = i%2 + 1;
        }else{
            row = i/kMaxCountForRow + 1;
            col = i%kMaxCountForRow + 1;
        }
        
        SudokuItem *item = self.subviews[i];
        item.frame = CGRectMake((col-1) * (kItemWH + kMargin) + kMargin, (row -1) * (kItemWH + kMargin) + kMargin, kItemWH, kItemWH);
    }
}

+ (CGSize)sizeWithItemCount:(NSInteger)itemCount{
    if (itemCount == 0) {
        return CGSizeZero;
    }else if(itemCount <= kMaxCountForRow){
        return CGSizeMake((kItemWH + kMargin)*itemCount + kMargin, (kItemWH + kMargin) + kMargin);
    }else{
        NSInteger totalCols = 0;
        NSInteger totalRows = 0;
        totalCols = 3;
        totalRows = (itemCount - 1)/kMaxCountForRow + 1;
        if (itemCount == 4) {
            totalCols = 2;
            totalRows = 2;
        }
        return CGSizeMake((kItemWH + kMargin)*totalCols + kMargin, (kItemWH + kMargin)*totalRows + kMargin);
    }
}

- (void)addItem:(SudokuItem *)item{
    [self addSubview:item];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.items];
    [arr addObject:item];
    self.items = arr;
}

- (void)setItems:(NSArray *)items{
    for (SudokuItem *item in items) {
        [self addSubview:item];
    }
    _items = items;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self addGestureRecognizer:tap];
}

- (NSInteger)numberOfItems{
    return self.subviews.count;
}

@end
