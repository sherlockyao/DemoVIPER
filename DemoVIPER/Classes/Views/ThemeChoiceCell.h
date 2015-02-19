//
//  ThemeChoiceCell.h
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeInfo.h"

@interface ThemeChoiceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (void)showTheme:(ThemeInfo *)theme;

@end
