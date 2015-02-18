//
//  AskQuestionViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "AskQuestionViewController.h"
#import "NSArray+Utility.h"

@interface AskQuestionViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, QuestionListInterface, AnswerBoardInterface, ProgressHudInterface>

@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, strong) NSArray *emojiNames;

@end

@implementation AskQuestionViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

- (void)configureProperties {
  [super configureProperties];
  
  self.questions = @[];
  self.emojiNames = @[@"emoji_sorry_1", @"emoji_sorry_2", @"emoji_sorry_3", @"emoji_sorry_4", @"emoji_sorry_5", @"emoji_sorry_6", @"emoji_sorry_7"];
}

- (void)configureViews {
  [super configureViews];
  
  // text field
  self.questionTextField.delegate = self;
  [self.questionTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - IB Actions

- (IBAction)menuButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goToSettingScreen];
}

- (IBAction)historyButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goToNextScreen];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  //TODO:
  
  return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self hideKeyboardIfNeeded];
  //TODO: ask selected question
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [self hideKeyboardIfNeeded];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return NO;
}

- (void)textFieldDidChange:(id)sender {
  //TODO:
}

#pragma mark - QuestionListInterface

- (void)displayQuestions:(NSArray *)questions {
  self.questions = questions;
  [self.questionsTableView reloadData];
}

#pragma mark - AnswerBoardInterface

- (void)displayAnswer:(AnswerInfo *)answer {
  self.answerLabel.text = answer.content;
  self.emojiImageView.image = [UIImage imageNamed:[self.emojiNames sample]];
  self.answerBoardView.hidden = NO;
}

#pragma mark - ProgressHudInterface

- (void)beginProgress {
  //TODO:
}

- (void)endProgress {
  //TODO:
}

#pragma mark - Helper Methods

- (void)hideKeyboardIfNeeded {
  if ([self.questionTextField isFirstResponder]) {
    [self.questionTextField resignFirstResponder];
  }
}

@end
