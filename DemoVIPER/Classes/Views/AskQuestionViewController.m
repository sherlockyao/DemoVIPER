//
//  AskQuestionViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "AskQuestionViewController.h"
#import "MenuPanelView.h"
#import "NSArray+Utility.h"

static NSString *const QuestionCellReuseIdentifier = @"QuestionCell";

@interface AskQuestionViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, QuestionListInterface, AnswerBoardInterface, ProgressHudInterface, MenuPanelViewDelegate>

@property (nonatomic, strong) NSLayoutConstraint *menuPanelViewLeftConstraint;

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
  
  // table view
  self.questionsTableView.delegate = self;
  self.questionsTableView.dataSource = self;
  [self.questionsTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]]; // remove extra lines
  
  // menu panel
  MenuPanelView *menuPanelView = [MenuPanelView create];
  menuPanelView.delegate = self;
  [self.view addSubview:menuPanelView];
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:menuPanelView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:menuPanelView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
  [menuPanelView addConstraint:[NSLayoutConstraint constraintWithItem:menuPanelView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:280.f]];
  self.menuPanelViewLeftConstraint = [NSLayoutConstraint constraintWithItem:menuPanelView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:-280.f];
  [self.view addConstraint:self.menuPanelViewLeftConstraint];
  
  // wire up interfaces
  self.askQuestionPanelPresenter.questionList = self;
  self.askQuestionPanelPresenter.answerBoard = self;
  self.askQuestionPanelPresenter.progresshud = self;
  self.themeGroupPresenter.themeList = menuPanelView;
}

- (NSArray *)presenters {
  return [[super presenters] arrayByAddingObjectsFromArray:@[self.askQuestionPanelPresenter, self.themeGroupPresenter]];
}

#pragma mark - IB Actions

- (IBAction)menuButtonTouchUpInside:(id)sender {
  [self animateShowMenuPanelView];
}

- (IBAction)historyButtonTouchUpInside:(id)sender {
  [self.navigationPresenter goToNextScreen];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *questionCell = [tableView dequeueReusableCellWithIdentifier:QuestionCellReuseIdentifier forIndexPath:indexPath];
  QuestionInfo *question = self.questions[indexPath.row];
  questionCell.textLabel.text = question.content;
  
  return questionCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self hideKeyboardIfNeeded];
  QuestionInfo *question = self.questions[indexPath.row];
  self.questionTextField.text = question.content;
  [self.askQuestionPanelPresenter askQuestion:question];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [self hideKeyboardIfNeeded];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  if (0 < textField.text.length) {
    QuestionInfo *question = [QuestionInfo new];
    question.content = textField.text;
    [self.askQuestionPanelPresenter askQuestion:question];
  }
  return NO;
}

- (void)textFieldDidChange:(id)sender {
  self.answerBoardView.hidden = YES;
  [self.askQuestionPanelPresenter enteringQuestionText:self.questionTextField.text];
}

#pragma mark - MenuPanelViewDelegate

- (void)menuPanelDidClickManageTheme:(MenuPanelView *)menuPanelView {
  [self.navigationPresenter goToSettingScreenWithCurrentTheme:[menuPanelView selectedTheme]];
  [self animateHideMenuPanelView];
}

- (void)menuPanel:(MenuPanelView *)menuPanelView didChooseTheme:(ThemeInfo *)theme {
  self.navigationBarView.backgroundColor = theme.tintColor;
  [self animateHideMenuPanelView];
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
  [self.activityIndicatorView startAnimating];
  self.activityIndicatorView.hidden = NO;
  self.questionTextField.userInteractionEnabled = NO;
  self.questionsTableView.userInteractionEnabled = NO;
}

- (void)endProgress {
  [self.activityIndicatorView stopAnimating];
  self.activityIndicatorView.hidden = YES;
  self.questionTextField.userInteractionEnabled = YES;
  self.questionsTableView.userInteractionEnabled = YES;
}

#pragma mark - Animations

- (void)animateShowMenuPanelView {
  [UIView animateWithDuration:0.35f animations:^{
    self.menuPanelViewLeftConstraint.constant = 0;
    [self.view layoutIfNeeded];
  }];
}

- (void)animateHideMenuPanelView {
  [UIView animateWithDuration:0.35f animations:^{
    self.menuPanelViewLeftConstraint.constant = -280;
    [self.view layoutIfNeeded];
  }];
}

#pragma mark - Helper Methods

- (void)hideKeyboardIfNeeded {
  if ([self.questionTextField isFirstResponder]) {
    [self.questionTextField resignFirstResponder];
  }
}

@end
