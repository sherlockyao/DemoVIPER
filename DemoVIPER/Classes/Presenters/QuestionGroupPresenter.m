//
//  QuestionGroupPresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "QuestionGroupPresenter.h"
#import "Question+DataManager.h"
#import "Question+Utility.h"

@implementation QuestionGroupPresenter

- (void)viewDidLoad:(UIViewController *)viewController {
  [super viewDidLoad:viewController];
  
  // load and display all questions
  NSArray *questions = [self.questionRobotInteractor findAllHistoryQuestions];
  [self.questionList displayQuestions:questions];
}

@end
