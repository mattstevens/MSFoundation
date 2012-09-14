#import "NSBundle+Extras.h"

@implementation NSBundle (MSFoundataion)

- (NSString *)ms_bundleName {
	return [[self infoDictionary] objectForKey:@"CFBundleName"];
}

- (NSString *)ms_bundleDisplayVersion {
	NSDictionary *bundleInfo = [self infoDictionary];
	NSString *version = [bundleInfo objectForKey:@"CFBundleShortVersionString"];
	if (!version) {
		version = [bundleInfo objectForKey:@"CFBundleVersion"];
	}

	return version;
}

@end
