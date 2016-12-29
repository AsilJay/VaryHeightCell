//
//  CommentFrame.h
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"
#import "JJSudoku.h"
#import "ReplyController.h"

/*

 */

@interface CommentFrame : NSObject

@property (nonatomic,strong)  Comment *comment;

@property (nonatomic,assign)  CGFloat cellHeight;

@property (nonatomic,assign)  CGRect headerViewFrame;
@property (nonatomic,assign)  CGRect iconViewFrame;
@property (nonatomic,assign)  CGRect nameLabelFrame;
@property (nonatomic,assign)  CGRect locationLabelFrame;
@property (nonatomic,assign)  CGRect postTimeLabelFrame;

@property (nonatomic,assign)  CGRect bodyViewFrame;
@property (nonatomic,assign)  CGRect contentLabelFrame;
@property (nonatomic,assign)  CGRect sudokuFrame;

@property (nonatomic,assign)  CGRect   *replyControllerFrame;

@end
