//
//  SiriInteractor.m
//  DemoVIPER
//
//  Created by Sherlock on 10/29/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "SiriInteractor.h"

@implementation SiriInteractor

- (void)askQuestion:(NSString *)question {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [self.delegate siriInteractor:self didResponseToQuestion:question response:@"Sorry, I don't know."];
  });
}

@end
