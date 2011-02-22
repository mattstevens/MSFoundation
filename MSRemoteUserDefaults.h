//  Copyright (c) 2009-2011 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

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
