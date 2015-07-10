//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by James Carlson on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const SecondTickNotificationKey = @"secondTickNotification";
static NSString * const TimerCompleteNotificationKey = @"timerCompleteNotification";
static NSString * const NewRoundNotificationKey = @"newRoundNotification";


@interface Timer : NSObject

+(Timer *)sharedInstance;

@property (assign, nonatomic) NSInteger minutes;
@property (assign, nonatomic) NSInteger seconds;

-(void)startTimer;

-(NSString *)timeRemaining;
-(void)cancelTimer;

@end
