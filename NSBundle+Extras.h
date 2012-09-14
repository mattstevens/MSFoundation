#import <Foundation/Foundation.h>

@interface NSBundle (MSFoundation)

/** Returns the CFBundleName */
- (NSString *)ms_bundleName;

/** Returns the CFBundleShortVersionString or the CFBundleVersion if
CFBundleShortVersionString is not present. */
- (NSString *)ms_bundleDisplayVersion;

@end
