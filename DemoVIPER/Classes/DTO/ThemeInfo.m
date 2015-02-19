//
//  ThemeInfo.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "ThemeInfo.h"

@interface UIColor (PNUtility)

+ (UIColor *)colorWithHex:(long)hexColor;

@end

@implementation UIColor (PNUtility)

+ (UIColor *)colorWithHex:(long)hexColor {
  CGFloat red = ((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.f;
  CGFloat green = ((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.f;
  CGFloat blue = ((CGFloat)(hexColor & 0xFF)) / 255.f;
  return [self colorWithRed:red green:green blue:blue alpha:1.f];
}

@end


@implementation ThemeInfo

+ (instancetype)themeWithName:(NSString *)name color:(long)colorHex tintColor:(long)tintColorHex {
  ThemeInfo *theme = [ThemeInfo new];
  theme.name = name;
  theme.color = [UIColor colorWithHex:colorHex];
  theme.tintColor = [UIColor colorWithHex:tintColorHex];
  theme.enabled = YES;
  theme.selected = NO;
  
  return theme;
}

@end
