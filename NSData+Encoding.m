#import "NSData+Encoding.h"
#import <Security/Security.h>

@implementation NSData (MSFoundation)

+ (NSData *)ms_dataWithBase32String:(NSString *)base32String {
	return [self ms_dataWithString:base32String encoding:kSecBase32Encoding];
}

+ (NSData *)ms_dataWithBase64String:(NSString *)base64String {
	return [self ms_dataWithString:base64String encoding:kSecBase64Encoding];
}

- (NSString *)ms_base32String {
	return [self ms_stringWithEncoding:kSecBase32Encoding];
}

- (NSString *)ms_base64String {
	return [self ms_stringWithEncoding:kSecBase64Encoding];
}

+ (NSData *)ms_dataWithString:(NSString *)string encoding:(CFStringRef)encoding {
	NSData *data = [string dataUsingEncoding:NSASCIIStringEncoding];
	NSData *decodedData = nil;
	SecTransformRef decodeTransform = SecDecodeTransformCreate(encoding, NULL);
	if (decodeTransform) {
		SecTransformSetAttribute(decodeTransform, kSecTransformInputAttributeName, (CFDataRef)data, NULL);
		decodedData = [(NSData *)SecTransformExecute(decodeTransform, NULL) autorelease];
		CFRelease(decodeTransform);
	}

	return decodedData;
}

- (NSString *)ms_stringWithEncoding:(CFStringRef)encoding {
	NSString *string = nil;
	SecTransformRef encodeTransform = SecEncodeTransformCreate(encoding, NULL);
	if (encodeTransform) {
		SecTransformSetAttribute(encodeTransform, kSecTransformInputAttributeName, (CFDataRef)self, NULL);
		NSData *encodedData = [(NSData *)SecTransformExecute(encodeTransform, NULL) autorelease];
		string = [[[NSString alloc] initWithData:encodedData encoding:NSASCIIStringEncoding] autorelease];
		CFRelease(encodeTransform);
	}

	return string;
}

@end
