//
//  NavigationPresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BasePresenter.h"
#import "ThemeInfo.h"

@interface NavigationPresenter : BasePresenter

- (void)goBack;

- (void)goToNextScreen;
- (void)goToSettingScreenWithCurrentTheme:(ThemeInfo *)theme;

@end
