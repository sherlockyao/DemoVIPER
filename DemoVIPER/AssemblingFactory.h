//
//  AssemblingFactory.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssemblingFactory : NSObject

+ (UIViewController *)assembleSplashView;
+ (UIViewController *)assembleHomeViewWithParams:(NSDictionary *)params;

@end
