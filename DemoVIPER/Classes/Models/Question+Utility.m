//
//  Question+Utility.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "Question+Utility.h"
#import "Answer+Utility.h"

@implementation Question (Utility)

- (QuestionInfo *)questionInfo {
  QuestionInfo *info = [QuestionInfo new];
  info.content = self.content;
  info.timestamp = self.timestamp;
  if (self.answer) {
    info.answer = [self.answer answerInfo];
  }
  
  return info;
}

- (void)updateFromInfo:(QuestionInfo *)info {
  self.content = info.content;
  self.timestamp = info.timestamp ?: [NSDate date];
}

@end
