//
//  AppearanceController.m
//  The-Pomodoro-iOS8
//
//  Created by James Carlson on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AppearanceController.h"
#import <UIKit/UIKit.h>

@implementation AppearanceController

+(void)setAppAppearances {
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor purpleColor], NSFontAttributeName : [UIFont fontWithName:@"Baskerville-Bold" size:40]}];
    //    [[UITableView appearance]setTintColor:[UIColor lightGrayColor]];
    [[UITableView appearance]setBackgroundColor:[UIColor lightGrayColor]];
    [[UITableViewCell appearance]setBackgroundColor:[UIColor cyanColor]];
    [[UIBarButtonItem appearance]setTintColor:[UIColor greenColor]];
    [[UITextField appearance]setBackgroundColor:[UIColor orangeColor]];
    
}

+(NSArray *)setImagesToCells {
    return @[@"1.png", @"2.png", @"3.png", @"4.png", @"5.png", @"6.png", @"7.png", @"8.png", @"9.png", @"10.png", @"11.png"];

    
}


@end
