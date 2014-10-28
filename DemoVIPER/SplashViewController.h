//
//  SplashViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BaseViewController.h"
#import "ProgressViewInterface.h"
#import "InitializationPresenter.h"

@interface SplashViewController : BaseViewController <ProgressViewInterface>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) InitializationPresenter *initializationPresenter;

@end
