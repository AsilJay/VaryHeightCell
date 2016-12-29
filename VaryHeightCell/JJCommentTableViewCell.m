//
//  JJCommentTableViewCell.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "JJCommentTableViewCell.h"
#import "Sudoku.h"
#import "ReplyController.h"
#import "JJSudoku.h"
#import "SudokuItem.h"

@interface JJCommentTableViewCell ()

@property (strong, nonatomic)   UIView *headerView;
    @property (nonatomic,strong)  UIImageView *iconView;
    @property (nonatomic,strong)  UILabel *nameLabel;
    @property (nonatomic,strong)  UILabel *locationLabel;
    @property (nonatomic,strong)  UILabel *postTimeLabel;

@property (nonatomic,strong)  UIView *bodyView;
    @property (nonatomic,strong)  UILabel *contentLabel;
    @property (nonatomic,strong)  JJSudoku *sudoku;

@property (nonatomic,strong)  ReplyController   *replyController;
//    @property (nonatomic,strong)  UIView *operationView;
//        @property (nonatomic,strong)  UIButton *deleteButton;
//        @property (nonatomic,strong)  UIButton *favor;
//        @property (nonatomic,strong)  UIButton *commentButton;




@end


@implementation JJCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        self.x = kCellMargin;
        self.y = kCellMargin;
        self.width = kScreenH - 2 * kCellMargin;
//        self.contentView.layer.cornerRadius = 5.0;
//        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.shadowOffset = CGSizeMake(3, 3);
        self.contentView.backgroundColor = [UIColor grayColor];
        [self initSubViews];
    }
    return self;
}


- (void)initSubViews{
    [self.contentView addSubview:self.headerView];
    [self.headerView addSubview:self.iconView];
    [self.headerView addSubview:self.nameLabel];
    [self.headerView addSubview:self.locationLabel];
    [self.headerView addSubview:self.postTimeLabel];
    
    [self.contentView addSubview:self.bodyView];
    [self.bodyView addSubview:self.contentLabel];
    [self.bodyView addSubview:self.sudoku];
    
    [self.contentView addSubview:self.replyController.view];
}


#pragma mark - 懒加载
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
    }
    return _headerView;
}

- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        [_iconView setUserInteractionEnabled:YES];
        // 设置圆角
        //        [_icon.layer setCornerRadius:5.0];
        //        [_icon.layer setMasksToBounds:YES];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(displayUserInfo)];
        [_iconView addGestureRecognizer:tap];
    }
    return _iconView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setTextColor:[UIColor colorWithRed:87.0/255.0 green:107.0/255.0 blue:149.0/255.0 alpha:1.0]];
        [_nameLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(displayUserInfo)];
        [_nameLabel addGestureRecognizer:tap];
    }
    return _nameLabel;
}

- (UILabel *)locationLabel{
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc] init];
        [_locationLabel setTextColor:[UIColor grayColor]];
        [_locationLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return _locationLabel;
}

- (UILabel *)postTimeLabel{
    if (!_postTimeLabel) {
        _postTimeLabel = [[UILabel alloc] init];
        [_postTimeLabel setTextColor:[UIColor grayColor]];
        [_postTimeLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return _postTimeLabel;
}

- (UIView *)bodyView{
    if (!_bodyView) {
        _bodyView = [[UIView alloc] init];
        
    }
    return _bodyView;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setTextColor:[UIColor blackColor]];
        [_contentLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_contentLabel setNumberOfLines:0];
        [_contentLabel setUserInteractionEnabled:YES];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContent)];
        [tap setNumberOfTapsRequired:1];
        [tap setNumberOfTouchesRequired:1];
        [_contentLabel addGestureRecognizer:tap];
    }
    return _contentLabel;
}

- (JJSudoku *)sudoku{
    if (!_sudoku) {
        _sudoku = [[JJSudoku alloc] init];
        _sudoku.backgroundColor = [UIColor yellowColor];
    }
    return _sudoku;
}

- (ReplyController *)replyController{
    if (!_replyController) {
        _replyController = [[ReplyController alloc] init];
        [_replyController setDelegate:self];
    }
    return _replyController;
}

- (void)displayUserInfo{
    NSLog(@"%s",__func__);
}

- (void)tapContent{
    NSLog(@"%s",__func__);
}


/*
 @property (strong, nonatomic)   UIView *headerView;
 @property (nonatomic,strong)  UIImageView *iconView;
 @property (nonatomic,strong)  UILabel *nameLabel;
 @property (nonatomic,strong)  UILabel *locationLabel;
 @property (nonatomic,strong)  UILabel *postTimeLabel;
 
 @property (nonatomic,strong)  UIView *bodyView;
 @property (nonatomic,strong)  UIView *content;
 @property (nonatomic,strong)  UILabel *contentLabel;
 @property (nonatomic,strong)  Sudoku *sudoku;
 
 @property (nonatomic,strong)  ReplyController   *replyController;
 */

- (void)setCommentFrame:(CommentFrame *)commentFrame{
    _commentFrame = commentFrame;
    Comment *comment = commentFrame.comment;
    self.headerView.frame = commentFrame.headerViewFrame;
    self.iconView.frame = commentFrame.iconViewFrame;
    self.nameLabel.frame = commentFrame.nameLabelFrame;
    self.locationLabel.frame = commentFrame.locationLabelFrame;
    self.postTimeLabel.frame = commentFrame.postTimeLabelFrame;
    
    self.bodyView.frame = commentFrame.bodyViewFrame;
    self.contentLabel.frame = commentFrame.contentLabelFrame;
    self.sudoku.frame = commentFrame.sudokuFrame;
    
    self.iconView.image = [UIImage imageNamed:comment.head];
    self.iconView.userInteractionEnabled = YES;
    self.nameLabel.text = comment.name;
    self.locationLabel.text = comment.location;
    self.postTimeLabel.text = [NSString transformWithTime:comment.postTime] ;
    
    self.contentLabel.text = comment.content;
    NSMutableArray *items = [NSMutableArray array];    
    for (NSString *imageName in comment.images) {
        SudokuItem *item = [[SudokuItem alloc] initWithImageName:imageName highLighted:imageName];
        [items addObject:item];
    }
    
    self.sudoku.items = items;
    self.sudoku.selectedItem = ^(JJSudoku *sudoku, NSInteger index){
        NSLog(@"click image - %zd",index);
    };
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
