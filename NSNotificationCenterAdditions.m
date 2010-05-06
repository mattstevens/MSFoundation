//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import "NSNotificationCenterAdditions.h"

@implementation NSNotificationCenter (MSFoundation)

- (void)postNotificationOnMainThread:(NSNotification *)notification {
	if ([NSThread isMainThread]) {
		[[NSNotificationCenter defaultCenter] postNotification:notification];
		return;
	}
	
	[self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:NO];
}

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object {
	[self postNotificationOnMainThreadWithName:name object:object userInfo:nil];
}

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
	if ([NSThread isMainThread]) {
		[[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
		return;
	}
	
	NSNotification *notification = [NSNotification notificationWithName:name object:object userInfo:userInfo];
	[self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:NO];
}

@end
