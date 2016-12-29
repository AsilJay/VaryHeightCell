//
//  ViewController.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/4.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "ViewController.h"
#import "Comment.h"
#import "CommentFrame.h"
#import "JJCommentTableViewCell.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic)   NSMutableArray *comments;

@property (strong, nonatomic)   NSMutableArray *frames;


@end

@implementation ViewController

- (NSMutableArray *)frames{
    if (!_frames) {
        _frames = [NSMutableArray array];
    }
    return _frames;
}

- (NSMutableArray *)comments{
    if (!_comments) {
        _comments = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"animals.plist" ofType:nil];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *arr = dic[@"animals"];
        for (NSDictionary *dict in arr) {
            
            Comment *comment = [Comment commentWithDictionary:dict];
            [_comments addObject:comment];
            
            
            CommentFrame *commentFrame = [[CommentFrame alloc] init];
            commentFrame.comment = comment;
            [self.frames addObject:commentFrame];
            
        }
    }
    return _comments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    self.contentView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    self.contentView.y = 20;
    CGFloat currentHeight = 20;
    for (int i = 0; i < self.comments.count; i++) {
        JJCommentTableViewCell *cell = [[JJCommentTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];
        
        
        
        CommentFrame *commentFrame = self.frames[i];
        cell.commentFrame = commentFrame;
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.height = commentFrame.cellHeight;
        cell.width = kScreenW - 2*kCellMargin;
        cell.y = currentHeight + i*kCellMargin;
        currentHeight += cell.height;
        
        cell.layer.cornerRadius = 5.0;
        cell.layer.masksToBounds = YES;
        
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.contentView.frame = CGRectMake(0, 0, kScreenW, currentHeight + i*kCellMargin + 20);
        self.scrollView.contentSize = CGSizeMake(kScreenW, self.contentView.height);
        
        [self.contentView addSubview:cell];
        
        
        
    }
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
