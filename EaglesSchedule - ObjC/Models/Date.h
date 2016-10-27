//
//  Date.h
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject

@property (strong, nonatomic) NSString *numeric;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSDate *timestamp;

+ (Date *)parseDateWithNSDate:(NSDate *) dateObj;
+ (NSString *)getTime: (NSDate *)date;
+ (NSString *)getDate: (NSDate *)date;

@end
