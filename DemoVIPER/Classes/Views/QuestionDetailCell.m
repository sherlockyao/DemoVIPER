//
//  QuestionDetailCell.m
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "QuestionDetailCell.h"

@implementation QuestionDetailCell

- (void)awakeFromNib {
  self.contentBubbleView.layer.cornerRadius = 8.f;
}

- (void)showQuestion:(QuestionInfo *)question {
  static NSDateFormatter *dateFormatter;
  if (!dateFormatter) {
    dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MM/dd h:mm a"];
  }
  self.dateLabel.text = [dateFormatter stringFromDate:question.timestamp];
  self.questionLabel.text = [NSString stringWithFormat:@"Q: %@", question.content];
  self.answerLabel.text = [NSString stringWithFormat:@"A: %@", question.answer.content];
}

@end
