#import <Foundation/Foundation.h>

@interface NSString (MSFoundation)

- (NSString *)ms_stringByTrimmingWhitespace;
- (NSString *)ms_stringByRemovingDuplicateWhitespace;
- (NSString *)ms_stringByURLEncoding;
- (NSString *)ms_stringByURLDecoding;

- (BOOL)ms_isEmpty;
- (BOOL)ms_containsOnlyCharactersInSet:(NSCharacterSet *)set;

@end

@interface NSMutableString (MSFoundation)

- (void)ms_trimWhitespace;

@end
