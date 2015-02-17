//
//  PageMessenger.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * PageMessenger contains metadata & params, passing it while navigating between view controllers
 *
 * It acts like a role of Segue in Storyboard
 **/
@interface PageMessenger : NSObject

@property (readonly, nonatomic, strong) NSString *name;

+ (instancetype)messenger;
+ (instancetype)messengerWithName:(NSString *)name;

- (NSDictionary *)params;
- (void)addParam:(NSString *)name value:(id)value;


@end
