//
//  NSString+timeFormatter.h
//  VaryHeightCell
//
//  Created by myjawdrops on 16/12/7.
//  Copyright © 2016年 MyJawDrops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (timeFormatter)

+ (NSString *) transformWithTime:(NSString *)str;
+ (NSString *) transformTimeSince1970:(NSString *)str;

@end
