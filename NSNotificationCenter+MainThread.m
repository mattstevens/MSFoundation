#import "NSNotificationCenter+MainThread.h"

@implementation NSNotificationCenter (MSFoundation)

- (void)ms_postNotificationOnMainThread:(NSNotification *)notification {
	if ([NSThread isMainThread]) {
		[[NSNotificationCenter defaultCenter] postNotification:notification];
		return;
	}

	[self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:NO];
}

- (void)ms_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object {
	[self ms_postNotificationOnMainThreadWithName:name object:object userInfo:nil];
}

- (void)ms_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo {
	if ([NSThread isMainThread]) {
		[[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
		return;
	}

	NSNotification *notification = [NSNotification notificationWithName:name object:object userInfo:userInfo];
	[self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:NO];
}

@end
