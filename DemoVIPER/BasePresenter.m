//
//  BasePresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BasePresenter.h"

@implementation BasePresenter

- (id)parameterNamed:(NSString *)paramName {
  return [self.mainViewController.params valueForKey:paramName];
}

- (void)viewDidLoad:(UIViewController *)viewController { }

- (void)view:(UIViewController *)viewController willAppear:(BOOL)animated { }

- (void)view:(UIViewController *)viewController didAppear:(BOOL)animated { }

- (void)view:(UIViewController *)viewController willDisappear:(BOOL)animated { }

- (void)view:(UIViewController *)viewController didDisappear:(BOOL)animated { }

@end
