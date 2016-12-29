//
//  Reply.m
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import "Reply.h"
#import "MJExtension.h"

@implementation Reply

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    Reply *reply = [[Reply alloc] init];
    reply = [Reply mj_objectWithKeyValues:dict];
    return reply;
    
}

+ (instancetype)replyWithDictionary:(NSDictionary *)dict{
    return [[Reply alloc] initWithDictionary:dict];
}

@end
