//
//  Date.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "Date.h"

@implementation Date

+ (Date *)parseDateWithNSDate:(NSDate *) dateObj{
    Date *date = [[Date alloc] init];
    date.time = [self getTime:dateObj];
    date.text = [self getDate:dateObj];
    return date;
}

+ (NSString *)getTime: (NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm a"];
    return [formatter stringFromDate:date];
}

+ (NSString *)getDate: (NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d"];
    return [formatter stringFromDate:date];
}

@end
