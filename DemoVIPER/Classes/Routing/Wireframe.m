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
#import "AskQuestionViewController.h"
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

+ (UIViewController *)entryScreen {
  return [self loadAskQuestionScreen];
}

+ (void)moveToNextScreenOfViewController:(UIViewController *)viewController messenger:(PageMessenger *)messenger {
  // find the corresponding selector
  SEL selector = [self selectorOfClass:[viewController class] messengerName:[messenger name]];
  
  // cast to IMP to avoid compiler's warning
  IMP imp = [[self class] methodForSelector:selector];
  id (*func)(id, SEL) = (id (*)(id, SEL))imp;
  
  BaseViewController *targetViewController = func([self class], selector);
  if (targetViewController) {
    targetViewController.params = [messenger params];
    dispatch_async(dispatch_get_main_queue(), ^{
      [viewController presentViewController:targetViewController animated:NO completion:nil];
    });
  }
}

+ (void)moveToPreviousScreenOfViewController:(UIViewController *)viewController {
  // it is very common we use navigation controller in the app
  // so we can add logic code here to check whether to use 'pop' or 'dismiss'
  dispatch_async(dispatch_get_main_queue(), ^{
    [viewController dismissViewControllerAnimated:YES completion:nil];
  });
}

#pragma mark - Route Mapping Methods

+ (BaseViewController *)loadAskQuestionScreen {
  return [AssemblingFactory assembleAskQuestionScreen];
}

+ (BaseViewController *)loadQuestionHistoryScreen {
  BaseViewController *viewController = [AssemblingFactory assembleQuestionHistoryScreen];
  viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  return viewController;
}

+ (BaseViewController *)loadSettingScreen {
  BaseViewController *viewController = [AssemblingFactory assembleSettingScreen];
  viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  return viewController;
}

+ (BaseViewController *)loadEmptyScreen {
  return nil;
}

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
                    [AskQuestionViewController wireframeKey:PageMessengerNameDefault] : @"loadQuestionHistoryScreen",
                    
                    [AskQuestionViewController wireframeKey:PageMessengerNameSetting] : @"loadSettingScreen",
                    };
  }
  NSString *selectorName = [selectorMap valueForKey:[[class description] conj:messengerName]];
  return selectorName ? NSSelectorFromString(selectorName) : @selector(loadEmptyScreen);
}

@end
