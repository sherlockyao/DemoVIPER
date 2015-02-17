//
//  SiriInteractor.h
//  DemoVIPER
//
//  Created by Sherlock on 10/29/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SiriInteractorDelegate;


@interface SiriInteractor : NSObject

@property (nonatomic, weak) id<SiriInteractorDelegate> delegate;

- (void)askQuestion:(NSString *)question;

@end


@protocol SiriInteractorDelegate <NSObject>

- (void)siriInteractor:(SiriInteractor *)siriInteractor didResponseToQuestion:(NSString *)question response:(NSString *)response;

@end
