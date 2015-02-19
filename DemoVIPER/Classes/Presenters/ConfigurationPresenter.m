//
//  ConfigurationPresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "ConfigurationPresenter.h"
#import "Config.h"

@implementation ConfigurationPresenter

- (void)enableThemeOfName:(NSString *)themeName {
  NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
  NSArray *disabledThemeNames = [userDefaultes arrayForKey:UserDefaultesKeyDisabledThemeNames] ?: @[];
  NSMutableArray *updatedDisabledThemeNames = [NSMutableArray array];
  for (NSString *disabledThemeName in disabledThemeNames) {
    if (![disabledThemeName isEqualToString:themeName]) {
      [updatedDisabledThemeNames addObject:disabledThemeName];
    }
  }
  [userDefaultes setObject:[NSArray arrayWithArray:updatedDisabledThemeNames] forKey:UserDefaultesKeyDisabledThemeNames];
  [userDefaultes synchronize];
  [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUpdateThemeSetting object:self userInfo:nil];
}

- (void)disableThemeOfName:(NSString *)themeName {
  NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
  NSArray *disabledThemeNames = [userDefaultes arrayForKey:UserDefaultesKeyDisabledThemeNames] ?: @[];
  [userDefaultes setObject:[disabledThemeNames arrayByAddingObject:themeName] forKey:UserDefaultesKeyDisabledThemeNames];
  [userDefaultes synchronize];
  [[NSNotificationCenter defaultCenter] postNotificationName:NotificationNameUpdateThemeSetting object:self userInfo:nil];
}

@end
