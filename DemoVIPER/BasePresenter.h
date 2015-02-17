//
//  BasePresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BasePresenter : NSObject

// The current view controller that is presenting user interfaces
// So the presenter can use it to navigate to other view controllers
@property (nonatomic, weak) BaseViewController *mainViewController;

- (id)parameterNamed:(NSString *)paramName;

- (void)viewDidLoad:(UIViewController *)viewController;
- (void)view:(UIViewController *)viewController willAppear:(BOOL)animated;
- (void)view:(UIViewController *)viewController didAppear:(BOOL)animated;
- (void)view:(UIViewController *)viewController willDisappear:(BOOL)animated;
- (void)view:(UIViewController *)viewController didDisappear:(BOOL)animated;

@end
