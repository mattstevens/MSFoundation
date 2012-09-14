#import "NSArray+Extras.h"

@implementation NSArray (MSFoundataion)

- (id)ms_firstObject {
	if ([self count] < 1)
		return nil;

	return [self objectAtIndex:0];
}

- (NSUInteger)ms_indexOfObjectWithValue:(id)value forKey:(NSString *)key {
	NSUInteger index = 0;
	for (id object in self) {
		if ([[object valueForKey:key] isEqual:value]) {
			return index;
		}
		index++;
	}

	return NSNotFound;
}

- (id)ms_objectWithValue:(id)value forKey:(NSString *)key {
	NSUInteger index = [self ms_indexOfObjectWithValue:value forKey:key];
	if (index == NSNotFound)
		return nil;

	return [self objectAtIndex:index];
}

- (BOOL)ms_containsObjectWithValue:(id)value forKey:(NSString *)key {
	NSUInteger index = [self ms_indexOfObjectWithValue:value forKey:key];
	return (index != NSNotFound);
}

@end
