//
//  ScheduleViewController.h
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "APIUtil.h"
#import "ColorUtil.h"
#import "ScheduleTableViewCell.h"

@interface ScheduleViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *scheduleTable;
    NSMutableArray *scheduleArray;
}

@end
