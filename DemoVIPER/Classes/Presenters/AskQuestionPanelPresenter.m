//
//  AskQuestionPanelPresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "AskQuestionPanelPresenter.h"

@implementation AskQuestionPanelPresenter

- (id)init {
  self = [super init];
  if (self) {
    _candidateQuestionCount = 3;
  }
  return self;
}

- (void)enteringQuestionText:(NSString *)text {
  NSArray *questions = [self.questionRobotInteractor findSimilarQuestionsWithText:text limitedCount:self.candidateQuestionCount];
  [self.questionList displayQuestions:questions];
}

- (void)askQuestion:(QuestionInfo *)question {
  [self.progresshud beginProgress];
  [self.questionRobotInteractor askQuestion:question completion:^(AnswerInfo *answer) {
    [self.progresshud endProgress];
    [self.answerBoard displayAnswer:answer];
  }];
}

@end
