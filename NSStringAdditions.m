//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import "NSStringAdditions.h"

@implementation NSString (MSFoundataion)

- (NSString *)stringByTrimmingWhitespace {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByRemovingDuplicateWhitespace {
	NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];	
	NSPredicate *noEmptyStringsPredicate = [NSPredicate predicateWithFormat:@"SELF != ''"];
	
	NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
	NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStringsPredicate];
	return [filteredArray componentsJoinedByString:@" "];
}

- (BOOL)isEmpty {
	return ([self length] < 1);
}

- (BOOL)containsOnlyCharactersInSet:(NSCharacterSet *)set {
	return [[self stringByTrimmingCharactersInSet:set] isEmpty];
}

@end

@implementation NSMutableString (MSFoundataion)

- (void)trimWhitespace {
	CFStringTrimWhitespace((CFMutableStringRef)self);
}

@end
