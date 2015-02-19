//
//  ThemeGroupPresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BasePresenter.h"
#import "ThemeListInterface.h"

@interface ThemeGroupPresenter : BasePresenter

@property (nonatomic, assign) BOOL needShowDisabledThemes;

@property (nonatomic, weak) id<ThemeListInterface> themeList;

@end
