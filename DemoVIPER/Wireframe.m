//
//  Wireframe.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "Wireframe.h"
#import "AssemblingFactory.h"
#import "NSString+Utility.h"
#import "UIViewController+Demo.h"
#import "SplashViewController.h"

@implementation Wireframe

+ (UIViewController *)entryPoint {
  return [AssemblingFactory assembleSplashView];
}

+ (void)moveToNextPageOfViewController:(UIViewController *)viewController messenger:(PageMessenger *)messenger {
  SEL selector = [self selectorOfClass:[viewController class] messengerName:[messenger name]];
  IMP imp = [[self class] methodForSelector:selector];
  void (*func)(id, SEL, UIViewController*, NSDictionary*) = (void *)imp;
  func([self class], selector, viewController, [messenger params]);
}

#pragma mark - Navigation Methods

+ (void)moveToHomeViewController:(UIViewController *)viewController params:(NSDictionary *)params {
  UIViewController *homeViewController = [AssemblingFactory assembleHomeViewWithParams:params];
  [viewController presentViewController:homeViewController animated:NO completion:nil];
}

#pragma mark - Private Methods

+ (SEL)selectorOfClass:(Class)class messengerName:(NSString *)messengerName {
  static NSDictionary *selectorMap = nil;
  if (!selectorMap) {
    selectorMap = @{
                    [SplashViewController wireframeKey:[PageMessenger defaultName]] : [NSValue valueWithPointer:@selector(moveToHomeViewController:params:)]
                    };
  }
  NSValue *value = [selectorMap valueForKey:[[class description] conj:messengerName]];
  return value ? [value pointerValue] : @selector(emptyMove:params:);
}

+ (void)emptyMove:(UIViewController *)viewController params:(NSDictionary *)params {
  // empty method for a nil selector
}

@end
