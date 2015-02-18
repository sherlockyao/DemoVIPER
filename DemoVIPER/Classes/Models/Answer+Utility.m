//
//  Answer+Utility.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "Answer+Utility.h"

@implementation Answer (Utility)

- (AnswerInfo *)answerInfo {
  AnswerInfo *info = [AnswerInfo new];
  info.content = self.content;
  
  return info;
}

- (void)updateFromInfo:(AnswerInfo *)info {
  self.content = info.content;
}

@end
