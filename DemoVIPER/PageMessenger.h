//
//  PageMessenger.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageMessenger : NSObject

+ (instancetype)messenger;
+ (instancetype)messengerWithName:(NSString *)name;

+ (NSString *)defaultName;

- (void)addParam:(NSString *)name value:(id)value;

- (NSString *)name;
- (NSDictionary *)params;

@end
