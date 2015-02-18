//
//  Question+DataManager.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "Question+DataManager.h"
#import "CoreData+MagicalRecord.h"
#import "Question+Utility.h"
#import "Answer+Utility.h"
#import "NSString+Utility.h"

@implementation Question (DataManager)

+ (NSArray *)findAllQuestions {
  return [Question MR_findAllSortedBy:@"timestamp" ascending:NO];
}

+ (NSArray *)findAllQuestionsHasPrefix:(NSString *)prefixText {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"content LIKE[cd] %@", [prefixText conj:@"*"]];
  return [Question MR_findAllSortedBy:@"timestamp" ascending:NO withPredicate:predicate];
}

+ (void)saveAnswer:(AnswerInfo *)answerInfo forQuestion:(QuestionInfo *)questionInfo completion:(void(^)(BOOL success, NSError *error))completion {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
    Question *question = [Question MR_createEntityInContext:localContext];
    Answer *answer = [Answer MR_createEntityInContext:localContext];
    question.answer = answer;
    [question updateFromInfo:questionInfo];
    [answer updateFromInfo:answerInfo];
  } completion:completion];
}

@end
