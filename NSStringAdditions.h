#import <Foundation/Foundation.h>

@interface NSString (MSFoundation)

- (NSString *)stringByTrimmingWhitespace;
- (NSString *)stringByRemovingDuplicateWhitespace;
- (NSString *)stringByURLEncoding;
- (NSString *)stringByURLDecoding;

- (BOOL)isEmpty;
- (BOOL)containsOnlyCharactersInSet:(NSCharacterSet *)set;

@end

@interface NSMutableString (MSFoundation)

- (void)trimWhitespace;

@end
