//
//  QuestionHistoryViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "QuestionHistoryViewController.h"

@interface QuestionHistoryViewController ()

@end

@implementation QuestionHistoryViewController

#pragma mark - IB Actions

- (IBAction)backButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goBack];
}


@end
