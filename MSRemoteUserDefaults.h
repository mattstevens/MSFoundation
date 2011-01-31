//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>


@interface MSRemoteUserDefaults : NSUserDefaults {
	NSString *bundleId;
}

+ (id)userDefaultsForBundle:(NSBundle *)theBundle;
+ (id)userDefaultsForBundleIdentifier:(NSString *)theBundleId;
- (id)initWithBundle:(NSBundle *)theBundle;
- (id)initWithBundleIdentifier:(NSString *)theBundleId;
- (NSString *)bundleIdentifier;
- (void)setBundleIdentifier:(NSString *)theBundleId;

@end
