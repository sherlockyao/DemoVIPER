//
//  UIStoryboard+Demo.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "UIStoryboard+Demo.h"

static NSString *const MainStoryboardName = @"Main";

@implementation UIStoryboard (Demo)

+ (instancetype)mainStoryboard {
  static UIStoryboard *storyboard = nil;
  if (!storyboard) {
    storyboard = [UIStoryboard storyboardWithName:MainStoryboardName bundle:nil];
  }
  return storyboard;
}

@end
