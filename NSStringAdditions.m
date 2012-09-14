#import "NSStringAdditions.h"

@implementation NSString (MSFoundataion)

- (NSString *)ms_stringByTrimmingWhitespace {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)ms_stringByRemovingDuplicateWhitespace {
	NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	NSPredicate *noEmptyStringsPredicate = [NSPredicate predicateWithFormat:@"SELF != ''"];

	NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
	NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStringsPredicate];
	return [filteredArray componentsJoinedByString:@" "];
}

- (NSString *)ms_stringByURLEncoding {
	return [(NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8) autorelease];
}

- (NSString *)ms_stringByURLDecoding {
	return [(NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8) autorelease];
}

- (BOOL)ms_isEmpty {
	return ([self length] < 1);
}

- (BOOL)ms_containsOnlyCharactersInSet:(NSCharacterSet *)set {
	return [[self stringByTrimmingCharactersInSet:set] ms_isEmpty];
}

@end

@implementation NSMutableString (MSFoundataion)

- (void)ms_trimWhitespace {
	CFStringTrimWhitespace((CFMutableStringRef)self);
}

@end
