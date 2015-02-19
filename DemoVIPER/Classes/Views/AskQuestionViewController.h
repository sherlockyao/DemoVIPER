//
//  AskQuestionViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BaseViewController.h"
#import "MenuPanelView.h"
#import "AskQuestionPanelPresenter.h"
#import "ThemeGroupPresenter.h"

@interface AskQuestionViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, QuestionListInterface, AnswerBoardInterface, ProgressHudInterface, MenuPanelViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *historyButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UITextField *questionTextField;
@property (weak, nonatomic) IBOutlet UITableView *questionsTableView;
@property (weak, nonatomic) IBOutlet UIView *answerBoardView;
@property (weak, nonatomic) IBOutlet UIImageView *emojiImageView;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) MenuPanelView *menuPanelView;

@property (nonatomic, strong) AskQuestionPanelPresenter *askQuestionPanelPresenter;
@property (nonatomic, strong) ThemeGroupPresenter *themeGroupPresenter;

@end
