//
//  AskQuestionPanelPresenterTests.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AskQuestionPanelPresenter.h"

@interface AskQuestionPanelPresenterTests : XCTestCase

@property (nonatomic, strong) AskQuestionPanelPresenter *presenter;
@property (nonatomic, strong) id progresshudMock;
@property (nonatomic, strong) id quesionListMock;
@property (nonatomic, strong) id answerBoardMock;

@end

@implementation AskQuestionPanelPresenterTests

- (void)setUp {
  [super setUp];
  self.presenter = [AskQuestionPanelPresenter new];
  self.presenter.questionRobotInteractor = OCMClassMock([QuestionRobotInteractor class]);

  self.progresshudMock = OCMProtocolMock(@protocol(ProgressHudInterface));
  self.quesionListMock = OCMProtocolMock(@protocol(QuestionListInterface));
  self.answerBoardMock = OCMProtocolMock(@protocol(AnswerBoardInterface));
  self.presenter.progresshud = self.progresshudMock;
  self.presenter.questionList = self.quesionListMock;
  self.presenter.answerBoard = self.answerBoardMock;
}

- (void)tearDown {
  self.presenter = nil;
  self.progresshudMock = nil;
  self.quesionListMock = nil;
  [super tearDown];
}

- (void)testEnteringQuestionText {
  self.presenter.candidateQuestionCount = 7;
  NSArray *questons = @[@"1", @"2"];
  id questionRobotInteractorMock = self.presenter.questionRobotInteractor;
  [[[questionRobotInteractorMock stub] andReturn:questons] findSimilarQuestionsWithText:@"test" limitedCount:7];

  [[self.quesionListMock expect] displayQuestions:questons];
  
  [self.presenter enteringQuestionText:@"test"];
  
  [self.quesionListMock verify];
}

// Dealing with block arguments
- (void)testAskQuestion {
  AnswerInfo *answer = [AnswerInfo new];
  id questionRobotInteractorMock = self.presenter.questionRobotInteractor;
  [[[questionRobotInteractorMock stub] andDo:^(NSInvocation *invoke) {
    void (^askQuestoinStubResponse)(AnswerInfo *answer);
    [invoke getArgument:&askQuestoinStubResponse atIndex:3];
    askQuestoinStubResponse(answer);
  }] askQuestion:[OCMArg any] completion:[OCMArg any]];
  
  [[self.progresshudMock expect] beginProgress];
  [[self.answerBoardMock expect] displayAnswer:answer];
  
  [self.presenter askQuestion:nil];
  
  [self.progresshudMock verify];
  [self.answerBoardMock verify];
}

@end
