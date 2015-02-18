//
//  SettingViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

#pragma mark - IB Actions

- (IBAction)backButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goBack];
}

@end
