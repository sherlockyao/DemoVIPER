//
//  MenuPanelView.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "MenuPanelView.h"
#import "ThemeChoiceCell.h"

static NSString *const ThemeChoiceCellReuseIdentifier = @"ThemeChoiceCell";

@interface MenuPanelView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *themes;
@property (readwrite, nonatomic, strong) ThemeInfo *selectedTheme;

@end


@implementation MenuPanelView

+ (instancetype)create {
  MenuPanelView *view = [[[NSBundle mainBundle] loadNibNamed:@"MenuPanelView" owner:nil options:nil] lastObject];
  view.translatesAutoresizingMaskIntoConstraints = NO;
  return view;
}

- (void)awakeFromNib {
  // configure properties
  self.themes = @[];
  self.selectedTheme = nil;
  
  // configure views
  self.themeTableView.delegate = self;
  self.themeTableView.dataSource = self;
  [self.themeTableView registerNib:[UINib nibWithNibName:@"ThemeChoiceCell" bundle:nil] forCellReuseIdentifier:ThemeChoiceCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.themes count] + 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = nil;
  if (0 == indexPath.row) {
    // title cell
    cell = [UITableViewCell new];
    cell.textLabel.text = @"Choose Theme";
    cell.backgroundColor = [UIColor clearColor];
  } else if ([self.themes count] < indexPath.row) {
    // manage themes cell
    cell = [UITableViewCell new];
    cell.textLabel.text = @"Manage Themes";
    cell.imageView.image = [UIImage imageNamed:@"menu_icon_setting"];
    cell.backgroundColor = [UIColor clearColor];
  } else {
    // theme choice cell
    cell = [tableView dequeueReusableCellWithIdentifier:ThemeChoiceCellReuseIdentifier forIndexPath:indexPath];
    ThemeInfo *theme = self.themes[(indexPath.row - 1)];
    [(ThemeChoiceCell *)cell showTheme:theme];
  }
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if ([self.themes count] < indexPath.row) {
    if ([self.delegate respondsToSelector:@selector(menuPanelDidClickManageTheme:)]) {
      [self.delegate menuPanelDidClickManageTheme:self];
    }
  } else if (0 < indexPath.row) {
    self.selectedTheme = self.themes[(indexPath.row - 1)];
    self.titleBoardView.backgroundColor = self.selectedTheme.color;
    if ([self.delegate respondsToSelector:@selector(menuPanel:didChooseTheme:)]) {
      [self.delegate menuPanel:self didChooseTheme:self.selectedTheme];
    }
  }
}

#pragma mark - ThemeListInterface

- (void)displayThemes:(NSArray *)themes {
  self.themes = themes;
  [self.themeTableView reloadData];
}

@end
