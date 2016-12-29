//
//  Reply.h
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/5.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reply : NSObject

@property (strong, nonatomic)   NSMutableArray *images;
@property (nonatomic,copy)  NSString *content;
@property (nonatomic,copy)  NSString *fromWhom;
@property (nonatomic,copy)  NSString *toWhom;

+ (instancetype)replyWithDictionary:(NSDictionary *)dict;

@end
