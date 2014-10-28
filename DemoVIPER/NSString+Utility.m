//
//  NSString+Utility.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)

- (NSString *)conj:(NSString *)str {
  return [NSString stringWithFormat:@"%@%@", self, (str ? str : @"")];
}

@end
