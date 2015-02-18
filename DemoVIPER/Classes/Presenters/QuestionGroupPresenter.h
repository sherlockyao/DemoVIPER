//
//  QuestionGroupPresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BasePresenter.h"
#import "QuestionListInterface.h"
#import "QuestionRobotInteractor.h"

@interface QuestionGroupPresenter : BasePresenter

@property (nonatomic, weak) id<QuestionListInterface> questionList;

@property (nonatomic, strong) QuestionRobotInteractor *questionRobotInteractor;

@end
