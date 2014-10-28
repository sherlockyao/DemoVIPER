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
  return viewController;
}

+ (UIViewController *)assembleHomeViewWithParams:(NSDictionary *)params {
  HomeViewController *viewController = [[UIStoryboard mainStoryboard] instantiateViewControllerWithIdentifier:HomeViewIdentifier];
  return viewController;
}

@end
