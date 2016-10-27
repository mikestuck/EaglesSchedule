//
//  APIUtil.h
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XMLReader.h"
#import "Constants.h"
#import "Game.h"

@interface APIUtil : NSObject

+ (NSMutableArray *)getPreSeasonSchedule;
+ (NSMutableArray *)getRegSeasonSchedule;
+ (Team *)getTeam;
+ (NSString *)getRegularSeasonHeader;
+ (NSString *)getPreseasonHeader;

@end
