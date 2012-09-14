#import "NSStringAdditions.h"

@implementation NSString (MSFoundataion)

- (NSString *)ms_stringByTrimmingWhitespace {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)ms_stringByURLEncoding {
	return [(NSString*)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8) autorelease];
}

- (NSString *)ms_stringByURLDecoding {
	return [(NSString*)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8) autorelease];
}

@end

@implementation NSMutableString (MSFoundataion)

- (void)ms_trimWhitespace {
	CFStringTrimWhitespace((CFMutableStringRef)self);
}

@end
