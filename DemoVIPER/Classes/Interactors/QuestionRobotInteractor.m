//
//  QuestionRobotInteractor.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "QuestionRobotInteractor.h"
#import "Question+DataManager.h"
#import "Question+Utility.h"
#import "NSArray+Utility.h"

@implementation QuestionRobotInteractor

- (NSArray *)findAllHistoryQuestions {
  NSArray *questions = [Question findAllQuestions];
  NSMutableArray *questionInfos = [NSMutableArray arrayWithCapacity:[questions count]];
  for (Question *question in questions) {
    [questionInfos addObject:[question questionInfo]];
  }
  return questionInfos;
}

- (NSArray *)findSimilarQuestionsWithText:(NSString *)text limitedCount:(NSUInteger)limitedCount {
  NSArray *questions = (0 < text.length) ? [Question findAllQuestionsHasPrefix:text] : [Question findAllQuestions];
  NSMutableArray *questionInfos = [NSMutableArray arrayWithCapacity:limitedCount];
  
  // filter out same questions
  NSMutableSet *questionContentSet = [NSMutableSet set];
  for (Question *question in questions) {
    if (limitedCount == [questionInfos count]) {
      break;
    }
    if (![questionContentSet containsObject:question.content]) {
      [questionContentSet addObject:question.content];
      [questionInfos addObject:[question questionInfo]];
    }
  }
  
  return questionInfos;
}

- (void)askQuestion:(QuestionInfo *)question completion:(void(^)(AnswerInfo *answer))completion {
  static NSArray *answers;
  if (!answers) {
    answers = @[
                @"I have no idea.",
                @"Who knows?",
                @"Don’t ask me!",
                @"Beats me!",
                @"Your guess is as good as mine.",
                @"Dunno.",
                @"I haven’t a clue. Sorry.",
                @"I haven’t the faintest idea.",
                @"How should I know?",
                @"It’s anyone’s guess.",
                @"That’s a really good question, I’ll find out.",
                @"That requires a bit more research first.",
                @"I’m going to investigate that further.",
                @"That’s not my area of expertise.",
                @"That’s something I want you to find out for yourself.",
                @"What do YOU think?",
                @"Search me!",
                @"It could be one of many possibilities.",
                @"There are several possible answers.",
                @"I haven’t had time to think that through yet.",
                @"I’ve been wondering the same thing!"
                ];
  }
  // usually we will send APIs calls to the server, then continue the logic flow after receiving data
  // here we just wait 2 secs to simulate the API calls
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    AnswerInfo *answer = [AnswerInfo new];
    answer.content = [answers sample];
    [Question saveAnswer:answer forQuestion:question completion:^(BOOL success, NSError *error) {
      if (completion) {
        completion(answer);
      }
    }];
  });
}

@end
