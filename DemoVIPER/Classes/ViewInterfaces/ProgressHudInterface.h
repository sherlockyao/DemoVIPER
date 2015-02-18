//
//  ProgressHudInterface.h
//  DemoVIPER
//
//  Created by Sherlock on 2/18/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProgressHudInterface <NSObject>

- (void)beginProgress;
- (void)endProgress;

@end
