//  Copyright (c) 2012 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import "NSBundleAdditions.h"

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
