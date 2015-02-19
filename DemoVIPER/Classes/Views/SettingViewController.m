//
//  SettingViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "SettingViewController.h"
#import "ThemeSettingCell.h"

static NSString *const ThemeSettingCellReuseIdentifier = @"ThemeSettingCell";

@interface SettingViewController () <UITableViewDataSource, ThemeSettingCellDelegate, ThemeListInterface>

@property (nonatomic, strong) NSArray *themes;

@end


@implementation SettingViewController

- (void)configureProperties {
  [super configureProperties];

  self.themes = @[];
}

- (void)configureViews {
  [super configureViews];
  
  // table view
  self.themesTableView.dataSource = self;
  self.themesTableView.rowHeight = 60.f;
  [self.themesTableView registerNib:[UINib nibWithNibName:@"ThemeSettingCell" bundle:nil] forCellReuseIdentifier:ThemeSettingCellReuseIdentifier];
  
  // wire up interfaces
  self.themeGroupPresenter.themeList = self;
}

- (NSArray *)presenters {
  return [[super presenters] arrayByAddingObjectsFromArray:@[self.configurationPresenter, self.themeGroupPresenter]];
}

#pragma mark - IB Actions

- (IBAction)backButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goBack];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.themes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  ThemeSettingCell *themeSettingCell = [tableView dequeueReusableCellWithIdentifier:ThemeSettingCellReuseIdentifier forIndexPath:indexPath];
  themeSettingCell.delegate = self;
  ThemeInfo *theme = self.themes[indexPath.row];
  [themeSettingCell showTheme:theme];
  
  return themeSettingCell;
}

#pragma mark - ThemeSettingCellDelegate

- (void)themeSettingCell:(ThemeSettingCell *)themeSettingCell didChangeEnableStatus:(BOOL)enabled {
  NSIndexPath *indexPath = [self.themesTableView indexPathForCell:themeSettingCell];
  ThemeInfo *theme = self.themes[indexPath.row];
  if (enabled) {
    [self.configurationPresenter enableThemeOfName:theme.name];
  } else {
    [self.configurationPresenter disableThemeOfName:theme.name];
  }
}

#pragma mark - ThemeListInterface

- (void)displayThemes:(NSArray *)themes {
  self.themes = themes;
  [self.themesTableView reloadData];
}

@end
