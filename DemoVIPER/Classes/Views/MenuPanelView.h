//
//  MenuPanelView.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuPanelView : UIView

@property (weak, nonatomic) IBOutlet UITableView *themeTableView;

+ (instancetype)create;

@end
