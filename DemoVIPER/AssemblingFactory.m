//
//  AssemblingFactory.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "AssemblingFactory.h"
#import "UIStoryboard+Demo.h"
#import "SplashViewController.h"
#import "HomeViewController.h"

static NSString *const SplashViewIdentifier = @"SplashViewController";
static NSString *const HomeViewIdentifier = @"HomeViewController";

@implementation AssemblingFactory

+ (UIViewController *)assembleSplashView {
  SplashViewController *viewController = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:SplashViewIdentifier];
  InitializationPresenter *initializationPresenter = [InitializationPresenter new];
  
  // wire up
  viewController.initializationPresenter = initializationPresenter;
  initializationPresenter.progressView = viewController;
  initializationPresenter.mainViewController = viewController;
  
  return viewController;
}

+ (UIViewController *)assembleHomeView {
  HomeViewController *viewController = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:HomeViewIdentifier];
  CommunicatePresenter *communicatePresenter = [CommunicatePresenter new];
  SiriInteractor *siriInteractor = [SiriInteractor new];
  
  // wire up
  viewController.communicatePresenter = communicatePresenter;
  communicatePresenter.progressView = viewController;
  communicatePresenter.messageBoard = viewController;
  communicatePresenter.mainViewController = viewController;
  communicatePresenter.siriInteractor = siriInteractor;
  siriInteractor.delegate = communicatePresenter;
  
  return viewController;
}

@end
