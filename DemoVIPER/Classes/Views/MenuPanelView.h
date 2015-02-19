//
//  MenuPanelView.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeListInterface.h"
#import "ThemeInfo.h"

@protocol MenuPanelViewDelegate;

@interface MenuPanelView : UIView <ThemeListInterface>

@property (weak, nonatomic) IBOutlet UIView *titleBoardView;
@property (weak, nonatomic) IBOutlet UITableView *themeTableView;

@property (readonly, nonatomic, strong) ThemeInfo *selectedTheme;

@property (nonatomic, weak) id<MenuPanelViewDelegate> delegate;

+ (instancetype)create;

@end


@protocol MenuPanelViewDelegate <NSObject>

@optional
- (void)menuPanel:(MenuPanelView *)menuPanelView didChooseTheme:(ThemeInfo *)theme;
- (void)menuPanelDidClickManageTheme:(MenuPanelView *)menuPanelView;

@end
