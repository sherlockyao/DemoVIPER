//
//  ThemeSettingCell.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "ThemeSettingCell.h"

@implementation ThemeSettingCell

- (void)awakeFromNib {
  self.colorView.layer.cornerRadius = 20.f;
}

- (void)showTheme:(ThemeInfo *)theme {
  self.colorView.backgroundColor = theme.color;
  self.nameLabel.text = theme.name;
  if (theme.isCurrent) {
    self.statusLabel.hidden = NO;
    self.enableSwich.hidden = YES;
    self.backgroundColor = [UIColor lightGrayColor];
  } else {
    self.statusLabel.hidden = YES;
    self.enableSwich.hidden = NO;
    self.backgroundColor = [UIColor whiteColor];
  }
  [self.enableSwich setOn:theme.enabled animated:NO];
}

#pragma mark - IB Actions

- (IBAction)enableSwitchValueChanged:(id)sender {
  if ([self.delegate respondsToSelector:@selector(themeSettingCell:didChangeEnableStatus:)]) {
    [self.delegate themeSettingCell:self didChangeEnableStatus:[self.enableSwich isOn]];
  }
}

@end
