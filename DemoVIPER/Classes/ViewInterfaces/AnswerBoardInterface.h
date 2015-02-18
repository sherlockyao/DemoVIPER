//
//  AnswerBoardInterface.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnswerInfo.h"

@protocol AnswerBoardInterface <NSObject>

- (void)displayAnswer:(AnswerInfo *)answer;

@end
