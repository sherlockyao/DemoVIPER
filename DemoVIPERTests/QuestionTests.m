//
//  QuestionTests.m
//  DemoVIPER
//
//  Created by Sherlock on 2/19/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question+DataManager.h"
#import "CoreData+MagicalRecord.h"

@interface QuestionTests : XCTestCase

@end

@implementation QuestionTests

- (void)setUp {
  [super setUp];
  [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
  [MagicalRecord cleanUp];
  [super tearDown];
}

// Testing Core Data
- (void)testFindAllQuestoins {
  Question *q1 = [Question MR_createEntity];
  Question *q2 = [Question MR_createEntity];
  Question *q3 = [Question MR_createEntity];
  q1.content = @"q1";
  q2.content = @"q2";
  q3.content = @"q3";
  q2.timestamp = [NSDate date];
  q1.timestamp = [NSDate date];
  q3.timestamp = [NSDate date];

  NSArray *questions = [Question findAllQuestions];
  
  XCTAssertEqual(3, [questions count], @"should return all questions");
  XCTAssertEqualObjects(@"q1", ((Question *)questions[1]).content, @"questions should order by timestamp DEC");
}

@end
