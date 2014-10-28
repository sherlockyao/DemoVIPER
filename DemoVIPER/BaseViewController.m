//
//  BaseViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BaseViewController.h"
#import "BasePresenter.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)init {
  self = [super init];
  if (self) {
    _params = @{};
  }
  return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    _params = @{};
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  for (BasePresenter *presenter in [self presenters]) {
    [presenter viewDidLoad:self];
  }
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  for (BasePresenter *presenter in [self presenters]) {
    [presenter view:self willAppear:animated];
  }
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  for (BasePresenter *presenter in [self presenters]) {
    [presenter view:self didAppear:animated];
  }
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  for (BasePresenter *presenter in [self presenters]) {
    [presenter view:self willDisappear:animated];
  }
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  for (BasePresenter *presenter in [self presenters]) {
    [presenter view:self didDisappear:animated];
  }
}

- (NSArray *)presenters {
  return @[];
}

@end
