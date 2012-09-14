#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MSFoundation)

- (void)ms_postNotificationOnMainThread:(NSNotification *)notification;
- (void)ms_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object;
- (void)ms_postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;

@end
