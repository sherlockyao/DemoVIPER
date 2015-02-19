//
//  AppDelegate.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "AppDelegate.h"
#import "Wireframe.h"
#import "CoreData+MagicalRecord.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  if (isRunningTests()) {
    return YES;
  }
  
  [MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
  [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"Viper.sqlite"];
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window setRootViewController:[Wireframe entryScreen]];
  [self.window makeKeyAndVisible];
  
  return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
  [MagicalRecord cleanUp];
}

#pragma mark - Helper Methods

static BOOL isRunningTests(void) __attribute__((const));

static BOOL isRunningTests(void) {
  NSDictionary* environment = [[NSProcessInfo processInfo] environment];
  NSString* injectBundle = environment[@"XCInjectBundle"];
  NSString* pathExtension = [injectBundle pathExtension];
  
  return ([pathExtension isEqualToString:@"octest"] || [pathExtension isEqualToString:@"xctest"]);
}

@end
