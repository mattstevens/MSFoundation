//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import "MSRemoteUserDefaults.h"


@implementation MSRemoteUserDefaults

+ (id)userDefaultsForBundle:(NSBundle *)theBundle {
	return [[[self alloc] initWithBundle:theBundle] autorelease];
}

+ (id)userDefaultsForBundleIdentifier:(NSString *)theBundleId {
	return [[[self alloc] initWithBundleIdentifier:theBundleId] autorelease];
}

- (id)initWithBundle:(NSBundle *)theBundle {
	return [self initWithBundleIdentifier:[theBundle bundleIdentifier]];
}

- (id)initWithBundleIdentifier:(NSString *)theBundleId {
	if (self = [super init]) {
		[self setBundleIdentifier:theBundleId];
	}
	
	return self;
}

- (void)dealloc {
	[bundleId release];
	[super dealloc];
}

- (NSString *)bundleIdentifier {
	return [[bundleId copy] autorelease];
}

- (void)setBundleIdentifier:(NSString *)theBundleId {
	theBundleId = [theBundleId copy];
	[bundleId release];
	bundleId = theBundleId;
}

- (id)objectForKey:(NSString *)defaultName {
	return [(id)CFPreferencesCopyAppValue((CFStringRef)defaultName, (CFStringRef)bundleId) autorelease];
}

- (void)setObject:(id)value forKey:(NSString *)defaultName {
	CFPreferencesSetAppValue((CFStringRef)defaultName, (CFPropertyListRef)value, (CFStringRef)bundleId);
	
	// Invoke the superclass to get the normal periodic calls to synchronize.
	// No additional plist will be created since synchronize is overridden.
	[super setObject:value forKey:defaultName];
}

- (void)removeObjectForKey:(NSString *)defaultName {
	CFPreferencesSetAppValue((CFStringRef)defaultName, NULL, (CFStringRef)bundleId);
	
	// Invoke the superclass to get the normal periodic calls to synchronize.
	// No additional plist will be created since synchronize is overridden.
	[super removeObjectForKey:defaultName];
}

- (BOOL)synchronize {
	return CFPreferencesAppSynchronize((CFStringRef)bundleId);
}

@end
