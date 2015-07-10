//
//  TimerViewController.m
//  The-Pomodoro-iOS8
//
//  Created by James Carlson on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TimerViewController.h"
#import "Timer.h"

@interface TimerViewController ()

@property (strong) UILabel *timerLabel;
@property (strong) UIButton *timerButton;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.timerLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 150, 80, 40)];
    self.timerLabel.text = [[Timer sharedInstance]timeRemaining];
    self.timerLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.timerLabel];
    
    UIButton *timerButton = [[UIButton alloc]initWithFrame:CGRectMake(130, 200, 80, 40)];
    [timerButton setTitle:@"Start" forState:UIControlStateNormal];
    timerButton.titleLabel.textColor = [UIColor blackColor];
    timerButton.backgroundColor = [UIColor blueColor];
    
    [timerButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timerButton];
    [self notifications];
    [self updateTimerLabel];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed {
    
    [[Timer sharedInstance]startTimer];
    self.timerButton.enabled = NO;
    
}

-(void)updateTimerLabel {
    
    self.timerLabel.text = [[Timer sharedInstance]timeRemaining];
    self.timerLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.timerLabel];
    
}

-(void)notifications{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTimerLabel) name:SecondTickNotificationKey object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newRound) name:NewRoundNotificationKey object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(newRound) name:TimerCompleteNotificationKey object:nil];
}

-(void)newRound {
    [self updateTimerLabel];
    self.timerButton.enabled = YES;
}


-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
