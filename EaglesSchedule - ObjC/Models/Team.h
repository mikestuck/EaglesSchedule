//
//  Team.h
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Team : NSObject

@property (strong, nonatomic) NSString *triCode;
@property (strong, nonatomic) NSString *fullName;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *record;

+ (Team *)parseTeamWithDictionary:(NSDictionary *) teamDictionary;

@end
