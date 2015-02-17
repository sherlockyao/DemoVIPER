//
//  NavigationPresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "NavigationPresenter.h"
#import "Wireframe.h"
#import "Config.h"
#import "BaseViewController.h"

@implementation NavigationPresenter

- (void)goBack {
  [Wireframe moveToPreviousScreenOfViewController:self.mainViewController];
}

- (void)goToNextScreen {
  PageMessenger *pageMessenger = [PageMessenger messenger];
  [Wireframe moveToNextScreenOfViewController:self.mainViewController messenger:pageMessenger];
}

- (void)goToSettingScreen {
  PageMessenger *pageMessenger = [PageMessenger messengerWithName:PageMessengerNameSetting];
  [Wireframe moveToNextScreenOfViewController:self.mainViewController messenger:pageMessenger];
}

@end
