#import "NSStringAdditions.h"

@implementation NSString (MSFoundataion)

- (NSString *)ms_stringByTrimmingWhitespace {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end

@implementation NSMutableString (MSFoundataion)

- (void)ms_trimWhitespace {
	CFStringTrimWhitespace((CFMutableStringRef)self);
}

@end
