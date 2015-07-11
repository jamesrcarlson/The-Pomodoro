//
//  RoundsViewController.m
//  The-Pomodoro-iOS8
//
//  Created by James Carlson on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsViewController.h"
#import "RoundsController.h"
#import "Timer.h"
#import "AppearanceController.h"

@interface RoundsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

//@property (assign) UITableViewCell *cell;

@end

@implementation RoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"rounds"];

    [self.view addSubview:self.tableView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(roundComplete) name:TimerCompleteNotificationKey object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rounds"];
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"rounds"];
    
    NSArray *roundsArray = [RoundsController sharedInstance].roundTimes;
    NSNumber *minutes = roundsArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li minutes", (long)[minutes integerValue]];
    cell.imageView.image = [UIImage imageNamed:[AppearanceController setImagesToCells][indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [RoundsController sharedInstance].roundTimes.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [RoundsController sharedInstance].currentRound = indexPath.row;
    [[RoundsController sharedInstance] roundSelected];
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:NewRoundNotificationKey object:nil];
    
    [[Timer sharedInstance]cancelTimer];
    
}
/*
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *myCell = [UITableViewCell new];
////    myCell.imageView.image = [UIImage imageNamed:[AppearanceController setImagesToCells][10]];
//    myCell.backgroundColor = [UIColor lightGrayColor];
    [self setPicture];
}



-(UITableViewCell *)setPicture {

        UITableViewCell *myCell = [UITableViewCell new];
        myCell.imageView.image = [UIImage imageNamed:[AppearanceController setImagesToCells][10]];
        myCell.backgroundColor = [UIColor lightGrayColor];

    return myCell;
} */

-(void)roundComplete {
    if ([RoundsController sharedInstance].currentRound < [RoundsController sharedInstance].roundTimes.count - 1) {
        [RoundsController sharedInstance].currentRound++;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[RoundsController sharedInstance].currentRound inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[RoundsController sharedInstance] roundSelected];
    } else {
        [RoundsController sharedInstance].currentRound = 0;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[RoundsController sharedInstance].currentRound inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[RoundsController sharedInstance] roundSelected];
    }

}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
