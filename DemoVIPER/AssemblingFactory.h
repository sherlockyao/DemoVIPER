//
//  AssemblingFactory.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BaseViewController.h"

@interface AssemblingFactory : NSObject

+ (BaseViewController *)assembleSplashView;
+ (BaseViewController *)assembleHomeView;

@end
