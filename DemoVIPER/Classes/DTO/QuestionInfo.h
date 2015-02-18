//
//  QuestionInfo.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnswerInfo.h"

@interface QuestionInfo : NSObject

@property (nonatomic, strong) NSDate * timestamp;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) AnswerInfo * answer;

@end
