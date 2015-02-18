//
//  Question+DataManager.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "Question.h"
#import "QuestionInfo.h"

@interface Question (DataManager)

// these find methods will return questions order by timestamp DEC
+ (NSArray *)findAllQuestions;
+ (NSArray *)findAllQuestionsHasPrefix:(NSString *)prefix;

+ (void)saveAnswer:(AnswerInfo *)answerInfo forQuestion:(QuestionInfo *)questionInfo completion:(void(^)(BOOL success, NSError *error))completion;

@end
