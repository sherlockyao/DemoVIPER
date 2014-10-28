//
//  SplashViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (NSArray *)presenters {
  return @[self.initializationPresenter];
}

#pragma mark - ProgressViewInterface

- (void)beginProgress {
  [self.activityIndicator startAnimating];
}

- (void)endProgress {
  [self.activityIndicator stopAnimating];
}

@end
