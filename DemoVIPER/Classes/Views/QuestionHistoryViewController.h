//
//  QuestionHistoryViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BaseViewController.h"
#import "QuestionGroupPresenter.h"

@interface QuestionHistoryViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *questionsTableView;

@property (nonatomic, strong) QuestionGroupPresenter *questionGroupPresenter;

@end
