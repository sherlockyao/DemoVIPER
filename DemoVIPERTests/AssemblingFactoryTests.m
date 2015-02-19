//
//  AssemblingFactoryTests.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AssemblingFactory.h"
#import "AskQuestionViewController.h"

@interface AssemblingFactoryTests : XCTestCase

@end

@implementation AssemblingFactoryTests

- (void)testAssembleAskQuestionScreen {
  BaseViewController *assebledViewController = [AssemblingFactory assembleAskQuestionScreen];
  XCTAssertTrue([assebledViewController isKindOfClass:[AskQuestionViewController class]], @"create correct instance of VC");
  
  AskQuestionViewController *viewController = (AskQuestionViewController *)assebledViewController;
  XCTAssertNotNil(viewController.navigationPresenter, @"has navigation preseter");
  XCTAssertNotNil(viewController.themeGroupPresenter, @"has theme group preseter");
  XCTAssertNotNil(viewController.askQuestionPanelPresenter, @"has ask queestion panel preseter");
  XCTAssertNotNil(viewController.askQuestionPanelPresenter.questionRobotInteractor, @"has question robot interactor");
}

- (void)testAssembleAskQuestionScreenForThemeGroupPresenterConfiguration {
  AskQuestionViewController *viewController = (AskQuestionViewController *)[AssemblingFactory assembleAskQuestionScreen];
  ThemeGroupPresenter *themeGroupPresenter = viewController.themeGroupPresenter;
  
  XCTAssertFalse(themeGroupPresenter.needShowDisabledThemes, @"should not allow show diabled themes");
}

- (void)testAssembleAskQuestionScreenForAskQuestionPanelPresenterConfiguration {
  AskQuestionViewController *viewController = (AskQuestionViewController *)[AssemblingFactory assembleAskQuestionScreen];
  AskQuestionPanelPresenter *askQuestionPanelPresenter = viewController.askQuestionPanelPresenter;
  
  XCTAssertEqual(5, askQuestionPanelPresenter.candidateQuestionCount, @"need to should 5 candidate questions");
}

@end
