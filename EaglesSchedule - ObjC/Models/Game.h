//
//  Game.h
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
#import "Date.h"

@interface Game : NSObject

@property (strong, nonatomic) NSString *gameID;
@property (strong, nonatomic) NSString *week;
@property (strong, nonatomic) NSString *label;
@property (strong, nonatomic) NSString *type;
//@property (strong, nonatomic) BOOL *isHome;
@property (strong, nonatomic) NSString *tv;
@property (strong, nonatomic) NSString *radio;
@property (strong, nonatomic) NSString *venue;
@property (strong, nonatomic) NSString *result;
@property (strong, nonatomic) NSString *wlt;
@property (strong, nonatomic) NSString *gameState;
@property (strong, nonatomic) NSString *quarter;
@property (strong, nonatomic) NSString *awayScore;
@property (strong, nonatomic) NSString *homeScore;
@property (strong, nonatomic) Date *date;
@property (strong, nonatomic) Team *opponent;

+ (Game *)parseGameWithDictionary:(NSDictionary *) gameDictionary;


@end
