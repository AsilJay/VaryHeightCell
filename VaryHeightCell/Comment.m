//
//  Comment.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "Comment.h"
#import "MJExtension.h"

@interface Comment ()

@end

@implementation Comment

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    Comment *comment = [[Comment alloc] init];
    comment = [Comment mj_objectWithKeyValues:dict];
    return comment;
    
}

+ (instancetype)commentWithDictionary:(NSDictionary *)dict{
    
    return [[Comment alloc] initWithDictionary:dict];
}

@end
