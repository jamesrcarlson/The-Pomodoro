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

@property (weak) UILabel *timerLabel;
@property (strong) UIButton *timerButton;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *timerLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 150, 80, 40)];
    timerLabel.text = [[Timer sharedInstance]timeRemaining];
    timerLabel.textColor = [UIColor blackColor];
    [self.view addSubview:timerLabel];
    
    UIButton *timerButton = [[UIButton alloc]initWithFrame:CGRectMake(130, 200, 80, 40)];
    [timerButton setTitle:@"Start" forState:UIControlStateNormal];
    timerButton.titleLabel.textColor = [UIColor blackColor];
    timerButton.backgroundColor = [UIColor blueColor];
    
    [timerButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timerButton];
    [self notifications];
    

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
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
