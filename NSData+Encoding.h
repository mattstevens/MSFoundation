// Requires Security.framework

#import <Foundation/Foundation.h>

@interface NSData (MSFoundation)

+ (NSData *)ms_dataWithBase32String:(NSString *)base32String;
+ (NSData *)ms_dataWithBase64String:(NSString *)base64String;

- (NSString *)ms_base32String;
- (NSString *)ms_base64String;

@end
