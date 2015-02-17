//
//  InitializationPresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "InitializationPresenter.h"
#import "Wireframe.h"

@implementation InitializationPresenter

- (void)view:(UIViewController *)viewController didAppear:(BOOL)animated {
  [super view:viewController didAppear:animated];
  [self.progressView beginProgress];
  // fake init
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [self.progressView endProgress];
    [Wireframe moveToNextPageOfViewController:self.mainViewController messenger:[PageMessenger messenger]];
  });
}

@end
