//  Copyright (c) 2009-2010 Matt Stevens
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

- (NSString *)stringByURLEncoding {
	return [(NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8) autorelease];
}

- (NSString *)stringByURLDecoding {
	return [(NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8) autorelease];
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
