//
//  AskQuestionViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "AskQuestionViewController.h"

@interface AskQuestionViewController ()

@end

@implementation AskQuestionViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

#pragma mark - IB Actions

- (IBAction)menuButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goToSettingScreen];
}

- (IBAction)historyButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goToNextScreen];
}

@end
