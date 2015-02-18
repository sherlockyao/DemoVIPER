//
//  NSArray+Utility.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "NSArray+Utility.h"

@implementation NSArray (Utility)

- (id)sample {
  if (self.count == 0) {
    return nil;
  }
  NSUInteger index = arc4random_uniform((u_int32_t)self.count);
  return self[index];
}

@end
