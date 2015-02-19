//
//  ThemeGroupPresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "ThemeGroupPresenter.h"
#import "ThemeInfo.h"
#import "Config.h"

@implementation ThemeGroupPresenter

- (id)init {
  self = [super init];
  if (self) {
    _needShowDisabledThemes = NO;
  }
  return self;
}

- (void)viewDidLoad:(UIViewController *)viewController {
  [super viewDidLoad:viewController];
  NSArray *themes = [self loadNeededThemes];
  [self.themeList displayThemes:themes];
}

#pragma mark - Prviate Methods

- (NSArray *)loadNeededThemes {
  NSArray *allThemes = [self loadAllThemes];
  if (self.needShowDisabledThemes) {
    return allThemes;
  }
  NSMutableArray *themes = [NSMutableArray arrayWithCapacity:[allThemes count]];
  for (ThemeInfo *theme in allThemes) {
    if (theme.enabled) {
      [themes addObject:theme];
    }
  }
  return themes;
}

- (NSArray *)loadAllThemes {
  NSArray *defaultThemes = @[
                             [ThemeInfo themeWithName:@"Blue" color:0x42a5f5 tintColor:0xB8D0F2],
                             [ThemeInfo themeWithName:@"Indigo" color:0x3949ab tintColor:0x91A0FF],
                             [ThemeInfo themeWithName:@"Purple" color:0xab47bc tintColor:0xFFBDDD],
                             [ThemeInfo themeWithName:@"Red" color:0xef5350 tintColor:0xFFB6C3],
                             [ThemeInfo themeWithName:@"Pink" color:0xec407a tintColor:0xFFB0CD],
                             [ThemeInfo themeWithName:@"Orange" color:0xf57c00 tintColor:0xFFE771]
                             ];
  NSArray *disabledThemeNames = [[NSUserDefaults standardUserDefaults] arrayForKey:UserDefaultesKeyDisabledThemeNames];
  if (disabledThemeNames) {
    for (ThemeInfo *theme in defaultThemes) {
      theme.enabled = ![disabledThemeNames containsObject:theme.name];
    }
  }
  return defaultThemes;
}

@end
