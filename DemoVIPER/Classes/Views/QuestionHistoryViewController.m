//
//  QuestionHistoryViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "QuestionHistoryViewController.h"
#import "QuestionDetailCell.h"


static NSString *const QuestionDetialCellReuseIdentifier = @"QuestionDetailCell";


@interface QuestionHistoryViewController () <UITableViewDataSource, QuestionListInterface>

@property (nonatomic, strong) NSArray *questions;

@end


@implementation QuestionHistoryViewController

- (void)configureViews {
  [super configureViews];
  
  // table view
  self.questionsTableView.dataSource = self;
  self.questionsTableView.rowHeight = 78.f;
  [self.questionsTableView registerNib:[UINib nibWithNibName:@"QuestionDetailCell" bundle:nil] forCellReuseIdentifier:QuestionDetialCellReuseIdentifier];
  
  // wire up interfaces
  self.questionGroupPresenter.questionList = self;
}

- (NSArray *)presenters {
  return [[super presenters] arrayByAddingObjectsFromArray:@[self.questionGroupPresenter]];
}

#pragma mark - IB Actions

- (IBAction)backButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goBack];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionDetailCell *questionDetailCell = [tableView dequeueReusableCellWithIdentifier:QuestionDetialCellReuseIdentifier forIndexPath:indexPath];
  QuestionInfo *question = self.questions[indexPath.row];
  [questionDetailCell showQuestion:question];
  
  return questionDetailCell;
}

#pragma mark - QuestionListInterface

- (void)displayQuestions:(NSArray *)questions {
  self.questions = questions;
  [self.questionsTableView reloadData];
}

@end
