//
//  Question+Utility.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "Question.h"
#import "QuestionInfo.h"

@interface Question (Utility)

- (QuestionInfo *)questionInfo;
- (void)updateFromInfo:(QuestionInfo *)info;

@end
