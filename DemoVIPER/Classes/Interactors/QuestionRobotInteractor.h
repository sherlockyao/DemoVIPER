//
//  QuestionRobotInteractor.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionInfo.h"

@interface QuestionRobotInteractor : NSObject

- (NSArray *)findAllHistoryQuestions;
- (NSArray *)findSimilarQuestionsWithText:(NSString *)text limitedCount:(NSUInteger)limitedCount;

- (void)askQuestion:(QuestionInfo *)question completion:(void(^)(AnswerInfo *answer))completion;

@end
