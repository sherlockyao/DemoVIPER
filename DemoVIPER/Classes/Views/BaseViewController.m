//
//  BaseViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BaseViewController.h"

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

- (void)loadView {
  [super loadView];
  for (BasePresenter *presenter in [self presenters]) {
    presenter.mainViewController = self;
  }
  [self configureProperties];
  [self configureViews];
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

- (void)configureProperties {}

- (void)configureViews {
  // navigation view shadow
  self.navigationBarView.layer.shadowColor = [UIColor blackColor].CGColor;
  self.navigationBarView.layer.shadowOffset = CGSizeMake(0, 2.5f);
  self.navigationBarView.layer.shadowRadius = 1.5f;
  self.navigationBarView.layer.shadowOpacity = 0.1f;
}

- (NSArray *)presenters {
  return @[self.navigationPresenter];
}

@end
