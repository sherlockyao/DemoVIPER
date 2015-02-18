//
//  MenuPanelView.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "MenuPanelView.h"

@implementation MenuPanelView

+ (instancetype)create {
  MenuPanelView *view = [[[NSBundle mainBundle] loadNibNamed:@"MenuPanelView" owner:nil options:nil] lastObject];
  view.translatesAutoresizingMaskIntoConstraints = NO;
  return view;
}

@end
