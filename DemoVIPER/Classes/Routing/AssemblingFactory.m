//
//  AssemblingFactory.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "AssemblingFactory.h"
#import "AskQuestionViewController.h"
#import "QuestionHistoryViewController.h"
#import "SettingViewController.h"
#import <UIKit/UIKit.h>

static NSString *const AskQuestionScreenIdentifier = @"AskQuestionViewController";
static NSString *const QuestionHistoryScreenIdentifier = @"QuestionHistoryViewController";
static NSString *const SettingScreenIdentifier = @"SettingViewController";

static NSString *const QuestionStoryboardName = @"Question";
static NSString *const SettingStoryboardName = @"Setting";


/**
 * UIStoryboard Category
 **/
@interface UIStoryboard (Demo)

+ (instancetype)questionStoryboard;
+ (instancetype)settingStoryboard;

@end

@implementation UIStoryboard (Demo)

+ (instancetype)questionStoryboard {
  static UIStoryboard *storyboard = nil;
  if (!storyboard) {
    storyboard = [UIStoryboard storyboardWithName:QuestionStoryboardName bundle:nil];
  }
  return storyboard;
}

+ (instancetype)settingStoryboard {
  static UIStoryboard *storyboard = nil;
  if (!storyboard) {
    storyboard = [UIStoryboard storyboardWithName:SettingStoryboardName bundle:nil];
  }
  return storyboard;
}

@end



@implementation AssemblingFactory

+ (BaseViewController *)assembleAskQuestionScreen {
  AskQuestionViewController *viewController = [[UIStoryboard questionStoryboard] instantiateViewControllerWithIdentifier:AskQuestionScreenIdentifier];
  
  viewController.navigationPresenter = [self buildNavigationPresenter];
  viewController.askQuestionPanelPresenter = [self buildAskQuestionPanelPresenter];
  viewController.themeGroupPresenter = [self buildThemeGroupPresenterForMenu];
  
  return viewController;
}

+ (BaseViewController *)assembleQuestionHistoryScreen {
  QuestionHistoryViewController *viewController = [[UIStoryboard questionStoryboard] instantiateViewControllerWithIdentifier:QuestionHistoryScreenIdentifier];
  
  viewController.navigationPresenter = [self buildNavigationPresenter];
  viewController.questionGroupPresenter = [self buildQuestionGroupPresenter];

  return viewController;
}

+ (BaseViewController *)assembleSettingScreen {
  SettingViewController *viewController = [[UIStoryboard settingStoryboard] instantiateViewControllerWithIdentifier:SettingScreenIdentifier];
  
  viewController.navigationPresenter = [self buildNavigationPresenter];
  viewController.configurationPresenter = [self buildConfigurationPresenter];
  viewController.themeGroupPresenter = [self buildThemeGroupPresenterForSetting];
  
  return viewController;

}

#pragma mark - Assembling Presenters

+ (NavigationPresenter *)buildNavigationPresenter {
  return [NavigationPresenter new];
}

+ (QuestionGroupPresenter *)buildQuestionGroupPresenter {
  QuestionGroupPresenter *presenter = [QuestionGroupPresenter new];
  
  presenter.questionRobotInteractor = [QuestionRobotInteractor new];
  
  return presenter;
}

+ (AskQuestionPanelPresenter *)buildAskQuestionPanelPresenter {
  AskQuestionPanelPresenter *presenter = [AskQuestionPanelPresenter new];
  
  presenter.candidateQuestionCount = 5;
  presenter.questionRobotInteractor = [QuestionRobotInteractor new];
  
  return presenter;
}

+ (ConfigurationPresenter *)buildConfigurationPresenter {
  return [ConfigurationPresenter new];
}

+ (ThemeGroupPresenter *)buildThemeGroupPresenterForMenu {
  ThemeGroupPresenter *presenter = [ThemeGroupPresenter new];

  presenter.needShowDisabledThemes = NO;
  
  return presenter;
}

+ (ThemeGroupPresenter *)buildThemeGroupPresenterForSetting {
  ThemeGroupPresenter *presenter = [ThemeGroupPresenter new];
  
  presenter.needShowDisabledThemes = YES;
  
  return presenter;
}

@end
