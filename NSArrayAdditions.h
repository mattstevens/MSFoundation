//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

@interface NSArray (MSFoundation)

/** Returns the object in the array with the highest index value, or nil if the array is empty. */
- (id)firstObject;

/** Invokes isEqual: on the result of valueForKey: for each of the receiver's items, returning the lowest index with a matching value.
If none of the objects in the receiver contain a matching value, returns NSNotFound. */
- (NSUInteger)indexOfObjectWithValue:(id)value forKey:(NSString *)key;

/** Invokes isEqual: on the result of valueForKey: for each of the receiver's items, returning the first matching value. */
- (id)objectWithValue:(id)value forKey:(NSString *)key;

/** Invokes isEqual: on the result of valueForKey: for each of the receiver's items, returning YES if a matching object is found. */
- (BOOL)containsObjectWithValue:(id)value forKey:(NSString *)key;

@end
