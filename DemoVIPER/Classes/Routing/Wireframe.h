//
//  Wireframe.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageMessenger.h"

@interface Wireframe : NSObject

+ (UIViewController *)entryScreen;

+ (void)moveToNextScreenOfViewController:(UIViewController *)viewController messenger:(PageMessenger *)messenger;
+ (void)moveToPreviousScreenOfViewController:(UIViewController *)viewController;

@end
