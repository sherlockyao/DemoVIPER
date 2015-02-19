//
//  QuestionRobotInteractorTests.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "CoreData+MagicalRecord.h"
#import "QuestionRobotInteractor.h"
#import "Question.h"

@interface QuestionRobotInteractorTests : XCTestCase

@property (nonatomic, strong) QuestionRobotInteractor *interactor;

@end

@implementation QuestionRobotInteractorTests

- (void)setUp {
  [super setUp];
  [MagicalRecord setupCoreDataStackWithInMemoryStore];
  self.interactor = [QuestionRobotInteractor new];
}

- (void)tearDown {
  self.interactor = nil;
  [MagicalRecord cleanUp];
  [super tearDown];
}

// Testing Asynchronous Code
- (void)testAskQuestion {
  QuestionInfo *question = [QuestionInfo new];
  question.content = @"who are you";
  
  XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
  [self.interactor askQuestion:question completion:^(AnswerInfo *answer) {
    [expectation fulfill];
    XCTAssertEqual(1, [[Question MR_findAll] count], @"question should be saved");
  }];
  [self waitForExpectationsWithTimeout:2.5 handler:nil];
}

@end
