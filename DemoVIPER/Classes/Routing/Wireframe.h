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

+ (UIViewController *)entryPoint;

+ (void)moveToNextPageOfViewController:(UIViewController *)viewController messenger:(PageMessenger *)messenger;

@end
