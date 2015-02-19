//
//  ConfigurationPresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BasePresenter.h"

@interface ConfigurationPresenter : BasePresenter

- (void)enableThemeOfName:(NSString *)themeName;
- (void)disableThemeOfName:(NSString *)themeName;

@end
