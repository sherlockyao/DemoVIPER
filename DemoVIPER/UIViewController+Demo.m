//
//  UIViewController+Demo.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "UIViewController+Demo.h"
#import "NSString+Utility.h"

@implementation UIViewController (Demo)

+ (NSString *)wireframeKey:(NSString *)name {
  return [[[self class] description] conj:name];
}

@end
