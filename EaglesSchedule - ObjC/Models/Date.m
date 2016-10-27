//
//  Date.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "Date.h"

@implementation Date

/**
 Handler to parse out NSDate and create date object
 
 @param dateObj passed in nsdate
 
 @return newly created date object
 */

+ (Date *)parseDateWithNSDate:(NSDate *) dateObj{
    Date *date = [[Date alloc] init];
    date.time = [self getTime:dateObj];
    date.text = [self getDate:dateObj];
    return date;
}

/**
 Takes nsdate object and formats it to h:mm a "ie. 1:00 pm"

 @param date passed in nsdate object

 @return string value for time to be displayed
 */

+ (NSString *)getTime: (NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm a"];
    return [formatter stringFromDate:date];
}

/**
 Takes nsdate object and formats it to EEE, MMM d "ie. Sun, Sept 20th"
 
 @param date passed in nsdate object
 
 @return string value for date to be displayed
 */

+ (NSString *)getDate: (NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE, MMM d"];
    return [formatter stringFromDate:date];
}

@end
