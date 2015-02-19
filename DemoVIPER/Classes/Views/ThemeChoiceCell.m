//
//  ThemeChoiceCell.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "ThemeChoiceCell.h"

@implementation ThemeChoiceCell

- (void)awakeFromNib {
  self.colorView.layer.cornerRadius = 15.f;
}

- (void)showTheme:(ThemeInfo *)theme {
  self.colorView.backgroundColor = theme.color;
  self.nameLabel.text = theme.name;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
  [super setHighlighted:highlighted animated:animated];
  self.nameLabel.textColor = highlighted ? self.colorView.backgroundColor : [UIColor blackColor];
  self.backgroundColor = highlighted ? [UIColor lightGrayColor] : [UIColor clearColor];
}

@end
