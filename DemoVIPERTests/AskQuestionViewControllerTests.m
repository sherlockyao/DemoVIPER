//
//  AskQuestionViewControllerTests.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AskQuestionViewController.h"

@interface AskQuestionViewControllerTests : XCTestCase

@property (nonatomic, strong) AskQuestionViewController *viewController;

@end

@implementation AskQuestionViewControllerTests

- (void)setUp {
  [super setUp];
  self.viewController = [[UIStoryboard storyboardWithName:@"Question" bundle:nil] instantiateViewControllerWithIdentifier:@"AskQuestionViewController"];
  self.viewController.askQuestionPanelPresenter = OCMClassMock([AskQuestionPanelPresenter class]);
  self.viewController.navigationPresenter = OCMClassMock([NavigationPresenter class]);
  self.viewController.themeGroupPresenter = OCMClassMock([ThemeGroupPresenter class]);
  [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
  self.viewController = nil;
  [super tearDown];
}

#pragma mark - Test Configuration

- (void)testPreferredStatusBarStyle {
  XCTAssertEqual(UIStatusBarStyleLightContent, [self.viewController preferredStatusBarStyle], @"use light status bar style");
}

- (void)testWireUpInterfaces {
  id askQuestionPanelPresenter = self.viewController.askQuestionPanelPresenter;
  [[askQuestionPanelPresenter expect] setQuestionList:self.viewController];
  [[askQuestionPanelPresenter expect] setAnswerBoard:self.viewController];
  [[askQuestionPanelPresenter expect] setProgresshud:self.viewController];
  
  [self.viewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
  
  [askQuestionPanelPresenter verify];
}

- (void)testPresenters {
  XCTAssertEqual(3, [[self.viewController presenters] count], @"have correct number of presenters");
}

#pragma mark - Test ProgressHudInterface

- (void)testProgressHudInterfaceWhenBeginProgress {
  [self.viewController beginProgress];
  
  XCTAssertTrue([self.viewController.activityIndicatorView isAnimating], @"spinner should be animating");
  XCTAssertFalse(self.viewController.activityIndicatorView.hidden, @"spinner should be shown");
  XCTAssertFalse(self.viewController.questionTextField.userInteractionEnabled, @"disable user input");
  XCTAssertFalse(self.viewController.questionsTableView.userInteractionEnabled, @"disable user selecting questoin");
}

#pragma mark - Test QuestionListInterface

- (void)testQuestionListInterfaceWhenDisplayQuestions {
  NSArray *questions = [self buildQuestions];
  [self.viewController displayQuestions:questions];
  
  XCTAssertEqual([questions count], [self.viewController tableView:nil numberOfRowsInSection:0], @"should display all questions");
  
  UITableViewCell *tableCell = [self.viewController tableView:self.viewController.questionsTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
  XCTAssertEqualObjects(@"name 2", tableCell.textLabel.text, @"should display the correct question content");
}

#pragma mark - Test IB Actions

- (void)testClickMenuButton {
  self.viewController.needInstantAnimation = YES;
  [self.viewController.menuButton sendActionsForControlEvents:UIControlEventTouchUpInside];
  
  XCTAssertEqual(0, self.viewController.menuPanelView.frame.origin.x, @"menu panel view should be shown on left of the screen");
}

- (void)testClickHistoryButton {
  id navigationPresenterMock = self.viewController.navigationPresenter;
  [[navigationPresenterMock expect] goToNextScreen];
  
  [self.viewController.historyButton sendActionsForControlEvents:UIControlEventTouchUpInside];
  
  [navigationPresenterMock verify];
}

#pragma mark - Test UITextFieldDelegate

- (void)testReturnInputText {
  [self.viewController.questionTextField becomeFirstResponder];
  self.viewController.questionTextField.text = @"hello";
  id askQuestionPanelPresenter = self.viewController.askQuestionPanelPresenter;
  [[askQuestionPanelPresenter expect] askQuestion:[OCMArg any]];
  
  [self.viewController textFieldShouldReturn:self.viewController.questionTextField];
  
  [askQuestionPanelPresenter verify];
  XCTAssertFalse([self.viewController.questionTextField isFirstResponder], @"text field should resign first responder");
}

#pragma mark - Helper Methods

- (NSArray *)buildQuestions {
  NSMutableArray *questions = [NSMutableArray array];
  for (int i = 0; i < 5; i++) {
    QuestionInfo *question = [QuestionInfo new];
    question.content = [NSString stringWithFormat:@"name %lu", (long)i];
    [questions addObject:question];
  }
  return [NSArray arrayWithArray:questions];
}

@end
