#import <Foundation/Foundation.h>

@interface NSString (MSFoundation)

- (NSString *)ms_stringByTrimmingWhitespace;
- (NSString *)ms_stringByURLEncoding;
- (NSString *)ms_stringByURLDecoding;

@end

@interface NSMutableString (MSFoundation)

- (void)ms_trimWhitespace;

@end
