//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MSFoundation)

// postNotificationOnMainThreadWithName:object:userInfo is a private API, use a prefix

- (void)ms_postNotificationOnMainThread:(NSNotification *)notification;
- (void)ms_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object;
- (void)ms_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;

@end
