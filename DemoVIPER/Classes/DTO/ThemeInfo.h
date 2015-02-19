//
//  ThemeInfo.h
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeInfo : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) UIColor * color;
@property (nonatomic, strong) UIColor * tintColor;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) BOOL isCurrent;

+ (instancetype)themeWithName:(NSString *)name color:(long)colorHex tintColor:(long)tintColorHex;

@end
