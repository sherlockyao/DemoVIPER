//
//  ThemeSettingCell.h
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeInfo.h"

@protocol ThemeSettingCellDelegate;

@interface ThemeSettingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UISwitch *enableSwich;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property(nonatomic, weak) id<ThemeSettingCellDelegate> delegate;

- (void)showTheme:(ThemeInfo *)theme;

@end

@protocol ThemeSettingCellDelegate <NSObject>

@optional
- (void)themeSettingCell:(ThemeSettingCell *)themeSettingCell didChangeEnableStatus:(BOOL)enabled;

@end

