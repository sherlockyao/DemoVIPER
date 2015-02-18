//
//  Answer+Utility.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "Answer.h"
#import "AnswerInfo.h"

@interface Answer (Utility)

- (AnswerInfo *)answerInfo;
- (void)updateFromInfo:(AnswerInfo *)info;

@end
