//
//  NotificationController.h
//  The-Pomodoro-iOS8
//
//  Created by James Carlson on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface RoundsController : NSObject

+(RoundsController *)sharedInstance;

@property (strong, nonatomic, readonly) NSArray *roundTimes;

@property (assign) NSInteger *currentRound;

@end
