#import <Foundation/Foundation.h>

@interface MSRemoteUserDefaults : NSUserDefaults {
	NSString *bundleId;
	NSTimer *syncTimer;
}

+ (id)userDefaultsForBundleIdentifier:(NSString *)theBundleId;
- (id)initWithBundleIdentifier:(NSString *)theBundleId;
- (NSString *)bundleIdentifier;
- (void)setBundleIdentifier:(NSString *)theBundleId;

@end
