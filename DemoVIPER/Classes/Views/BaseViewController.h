//
//  BaseViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationPresenter.h"

@interface BaseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *navigationBarView;

@property (nonatomic, strong) NSDictionary *params;

@property (nonatomic, strong) NavigationPresenter *navigationPresenter;

// Overwrite these methods to do proper configurations
- (void)configureProperties;
- (void)configureViews;

- (NSArray *)presenters; // Overwrite this method to return all the presetners that want to have view related callbacks, like viewDidLoad: etc. (Note: you need to include [super presenters] too

@end
