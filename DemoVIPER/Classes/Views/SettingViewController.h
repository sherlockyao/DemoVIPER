//
//  SettingViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BaseViewController.h"
#import "ThemeGroupPresenter.h"
#import "ConfigurationPresenter.h"

@interface SettingViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *themesTableView;

@property (nonatomic, strong) ThemeGroupPresenter *themeGroupPresenter;
@property (nonatomic, strong) ConfigurationPresenter *configurationPresenter;

@end
