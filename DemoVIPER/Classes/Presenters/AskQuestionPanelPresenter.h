//
//  AskQuestionPanelPresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BasePresenter.h"
#import "ProgressHudInterface.h"
#import "QuestionListInterface.h"
#import "AnswerBoardInterface.h"
#import "QuestionRobotInteractor.h"

@interface AskQuestionPanelPresenter : BasePresenter

@property (nonatomic, assign) NSUInteger candidateQuestionCount;

@property (nonatomic, weak) id<ProgressHudInterface> progresshud;
@property (nonatomic, weak) id<QuestionListInterface> questionList;
@property (nonatomic, weak) id<AnswerBoardInterface> answerBoard;

@property (nonatomic, strong) QuestionRobotInteractor *questionRobotInteractor;

- (void)enteringQuestionText:(NSString *)text;
- (void)askQuestion:(QuestionInfo *)question;

@end
