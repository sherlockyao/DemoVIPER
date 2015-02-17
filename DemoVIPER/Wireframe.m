//
//  Wireframe.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "Wireframe.h"
#import "Config.h"
#import "AssemblingFactory.h"
#import "SplashViewController.h"
#import "NSString+Utility.h"
#import <UIKit/UIKit.h>

/**
 * UIViewController Category
 **/
@interface UIViewController (Demo)

+ (NSString *)wireframeKey:(NSString *)name;

@end

@implementation UIViewController (Demo)

+ (NSString *)wireframeKey:(NSString *)name {
  return [[[self class] description] conj:name];
}

@end



/**
 * Wireframe handles all the navigation between controllers, and passing parameters.
 *
 * Assembling Factory takes care of loading controllers/presenters/interactors, and wire them up.
 */
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
  BaseViewController *homeViewController = [AssemblingFactory assembleHomeView];
  homeViewController.params = params;
  [viewController presentViewController:homeViewController animated:NO completion:nil];
}

#pragma mark - Private Methods

/**
 * Here we are using a Dictionray for configurate the Navigation Logic of all the screens in the application.
 * We use [ViewController ClassName + Messenger Name] as the key, and the specific method as the value.
 * If we find a match in the dictionray, then we will run that method for next step.
 *
 * In future, to improve this, we could use XML or JSON files to configurate the map, then read the files and wire them up dynamically in code.
 **/
+ (SEL)selectorOfClass:(Class)class messengerName:(NSString *)messengerName {
  static NSDictionary *selectorMap = nil;
  if (!selectorMap) {
    selectorMap = @{
                    [SplashViewController wireframeKey:PageMessengerNameDefault] : [NSValue valueWithPointer:@selector(moveToHomeViewController:params:)]
                    };
  }
  NSValue *value = [selectorMap valueForKey:[[class description] conj:messengerName]];
  return value ? [value pointerValue] : @selector(emptyMove:params:);
}

+ (void)emptyMove:(UIViewController *)viewController params:(NSDictionary *)params {
  // empty method for a nil selector
}

@end
