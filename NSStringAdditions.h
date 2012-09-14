#import <Foundation/Foundation.h>

@interface NSString (MSFoundation)

- (NSString *)ms_stringByTrimmingWhitespace;

@end

@interface NSMutableString (MSFoundation)

- (void)ms_trimWhitespace;

@end
