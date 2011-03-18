//  Copyright (c) 2009-2011 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import "MSRemoteUserDefaults.h"

@interface MSRemoteUserDefaults (Private)

- (void)defaultsDidChange;

@end


@implementation MSRemoteUserDefaults

+ (id)userDefaultsForBundleIdentifier:(NSString *)theBundleId {
	return [[[self alloc] initWithBundleIdentifier:theBundleId] autorelease];
}

- (id)initWithBundleIdentifier:(NSString *)theBundleId {
	if (self = [super init]) {
		[self setBundleIdentifier:theBundleId];
	}

	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(synchronize)
												 name:NSApplicationWillTerminateNotification
											   object:nil];

	return self;
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[syncTimer invalidate];
	[syncTimer release];
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
	id obj = [(id)CFPreferencesCopyAppValue((CFStringRef)defaultName, (CFStringRef)bundleId) autorelease];
	if (obj == nil)
		obj = [[self volatileDomainForName:NSRegistrationDomain] objectForKey:defaultName];

	return obj;
}

- (void)setObject:(id)value forKey:(NSString *)defaultName {
	CFPreferencesSetAppValue((CFStringRef)defaultName, (CFPropertyListRef)value, (CFStringRef)bundleId);
	[self performSelectorOnMainThread:@selector(defaultsDidChange) withObject:nil waitUntilDone:NO];
}

- (void)removeObjectForKey:(NSString *)defaultName {
	CFPreferencesSetAppValue((CFStringRef)defaultName, NULL, (CFStringRef)bundleId);
	[self performSelectorOnMainThread:@selector(defaultsDidChange) withObject:nil waitUntilDone:NO];
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
	[defaults addEntriesFromDictionary:[super dictionaryRepresentation]];
	[defaults addEntriesFromDictionary:[self persistentDomainForName:bundleId]];
	return defaults;
}

- (BOOL)synchronize {
	@synchronized(self) {
		[syncTimer invalidate];
		[syncTimer release];
		syncTimer = nil;
	}
	return CFPreferencesAppSynchronize((CFStringRef)bundleId);
}

- (void)defaultsDidChange {
	@synchronized(self) {
		if (syncTimer == nil || ![syncTimer isValid]) {
			syncTimer = [[NSTimer scheduledTimerWithTimeInterval:3.0
														  target:self
														selector:@selector(synchronize)
														userInfo:nil
														 repeats:NO] retain];
		}
	}

	[[NSNotificationCenter defaultCenter] postNotificationName:NSUserDefaultsDidChangeNotification object:self];
}

@end
