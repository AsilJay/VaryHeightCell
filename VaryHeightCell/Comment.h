//
//  Comment.h
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (copy, nonatomic)     NSString *head;
@property (copy, nonatomic)     NSString *name;
@property (nonatomic,copy)      NSString *content;
@property (strong, nonatomic)   NSMutableArray *images;
@property (nonatomic,copy)      NSString *postTime;
@property (nonatomic,copy)      NSString *location;
@property (strong, nonatomic)   NSMutableArray *replies;

+ (instancetype)commentWithDictionary:(NSDictionary *)dict;

@end
