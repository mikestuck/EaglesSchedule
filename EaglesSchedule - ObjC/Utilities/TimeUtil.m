//
//  TimeUtil.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil

/**
 Converts String timestamp from response to local timezome

 @param timestamp response string

 @return converted to timezone date object
 */

+ (NSDate *)convertToTimeZone:(NSString *)timestamp{
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
    NSDate *date = [formatter dateFromString:timestamp];
    NSTimeInterval timeZoneSeconds = [[NSTimeZone localTimeZone] secondsFromGMT];
    return [date dateByAddingTimeInterval:timeZoneSeconds];
}

@end
