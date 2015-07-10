//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by James Carlson on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"



@interface Timer ()

@property (assign) BOOL isOn;

@end

@implementation Timer


+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
        
//        sharedInstance.minutes = 2;
//        sharedInstance.seconds = 59;
    });
    return sharedInstance;
}

- (void)startTimer {
    
    self.isOn = YES;
    
    [self checkActive];
}

-(void)endTimer {
    self.isOn = NO;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:TimerCompleteNotificationKey object:nil];
}

-(void)decreaseSecond {
    
    if (self.seconds > 0) {
        self.seconds--;
        [[NSNotificationCenter defaultCenter]postNotificationName:SecondTickNotificationKey object:nil];
    } else if (self.seconds == 0 && self.minutes >0){
        self.minutes--;
        self.seconds = 59;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotificationKey object:nil];
    } else {
        
        [self endTimer];
  
    }
}

-(void)checkActive {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    if (self.isOn) {
        [self decreaseSecond];
        [self performSelector:@selector(checkActive) withObject:nil afterDelay:1.0];
    }
}

-(void)cancelTimer {
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (NSString *)timeRemaining {
    
    NSString *timerString;
    
    if (self.minutes >= 10) {
        timerString = [NSString stringWithFormat:@"%li:", (long)self.minutes];
    } else {
        timerString = [NSString stringWithFormat:@"0%li:", (long)self.minutes];
    }
    if (self.seconds >=10) {
        timerString = [timerString stringByAppendingString:[NSString stringWithFormat:@"%li", (long)self.seconds]];
    }else {
        timerString = [timerString stringByAppendingString:[NSString stringWithFormat:@"0%li",(long)self.seconds]];
    }
    
    
    return timerString;
}


@end
