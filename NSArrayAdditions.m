#import "NSArrayAdditions.h"

@implementation NSArray (MSFoundataion)

- (id)firstObject {
	if ([self count] < 1)
		return nil;

	return [self objectAtIndex:0];
}

- (NSUInteger)indexOfObjectWithValue:(id)value forKey:(NSString *)key {
	NSUInteger index = 0;
	for (id object in self) {
		if ([[object valueForKey:key] isEqual:value]) {
			return index;
		}
		index++;
	}

	return NSNotFound;
}

- (id)objectWithValue:(id)value forKey:(NSString *)key {
	NSUInteger index = [self indexOfObjectWithValue:value forKey:key];
	if (index == NSNotFound)
		return nil;

	return [self objectAtIndex:index];
}

- (BOOL)containsObjectWithValue:(id)value forKey:(NSString *)key {
	NSUInteger index = [self indexOfObjectWithValue:value forKey:key];
	return (index != NSNotFound);
}

@end
