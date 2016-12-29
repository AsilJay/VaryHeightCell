//
//  CommentFrame.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "CommentFrame.h"
#define kIconWH 40
#define kMargin 10


@implementation CommentFrame

- (void)setComment:(Comment *)comment{
    _comment = comment;
    
    //计算各个部分的Frame
    
    //iconView
    CGFloat iconViewXY = kMargin;
    CGFloat iconViewWH = kIconWH;
    self.iconViewFrame = CGRectMake(iconViewXY, iconViewXY, iconViewWH, iconViewWH);
    
    //nameLabel
    CGFloat nameX = CGRectGetMaxX(self.iconViewFrame) + kMargin;
    CGSize nameSize = [comment.name holdSizeWithFontSize:15.0 bounding:CGSizeZero];
    CGFloat nameY = (iconViewWH - nameSize.height)/2 + kMargin;
    self.nameLabelFrame = CGRectMake(nameX, nameY, nameSize.width + 20, nameSize.height);
    
    //发布时间
    CGSize postTimeSize = [[NSString transformWithTime:comment.postTime] holdSizeWithFontSize:12 bounding:CGSizeZero];
    CGFloat postTimeX = kScreenW - 2*kCellMargin - kMargin - postTimeSize.width;
    CGFloat postTimeY = (iconViewWH - postTimeSize.height)/2 + kMargin;
    self.postTimeLabelFrame = CGRectMake(postTimeX, postTimeY, postTimeSize.width, postTimeSize.height);
    
    //发布地点
    CGSize locationSize = [comment.location holdSizeWithFontSize:12.0 bounding:CGSizeZero];
    CGFloat locationX = postTimeX - kMargin - locationSize.width;
    CGFloat locationY = postTimeY;
    self.locationLabelFrame = CGRectMake(locationX, locationY, locationSize.width, locationSize.height);
    
    //headerView
    CGPoint headerOrigin = CGPointZero;
    CGFloat headerW = kScreenW - 2 * kCellMargin;
    CGFloat headerH = 2*kMargin + iconViewWH;
    self.headerViewFrame = CGRectMake(headerOrigin.x, headerOrigin.y, headerW, headerH);
    
    
    CGFloat contentTmp = 0;
    if (comment.content != nil && ![comment.content isEqualToString:@""]) {
        //contentLabel
        CGPoint contentLabelOrigin = CGPointMake(kMargin, 0);
        CGFloat contentLabelW = kScreenW - kCellMargin*2 - kMargin;
        CGFloat contentLabelH = [comment.content holdSizeWithFontSize:14 bounding:CGSizeMake(contentLabelW, 0)].height;
        self.contentLabelFrame = CGRectMake(contentLabelOrigin.x, contentLabelOrigin.y, contentLabelW, contentLabelH);
        
        contentTmp = CGRectGetMaxY(self.contentLabelFrame);

    }else{
        self.contentLabelFrame = CGRectZero;
        contentTmp = kMargin;
    }
    
    //sudoku
    if (comment.images.count) {
        CGSize sudokuSize = [JJSudoku sizeWithItemCount:comment.images.count];
        self.sudokuFrame = CGRectMake(0, contentTmp, kScreenW - 2*kCellMargin, sudokuSize.height);
    }else{
        self.sudokuFrame = CGRectZero;
    }

    
   //bodyView
    self.bodyViewFrame = CGRectMake(0, self.headerViewFrame.size.height, self.contentLabelFrame.size.width, self.contentLabelFrame.size.height + self.sudokuFrame.size.height);
    
    
    //cellHeight
    self.cellHeight = CGRectGetMaxY(self.bodyViewFrame) + 2*kCellMargin;
    
    
    //Todo: replyController
    
    
}

@end
