//  Copyright (c) 2012 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import "NSData+Encoding.h"
#import <Security/Security.h>

@implementation NSData (MSFoundation)

+ (NSData *)ms_dataWithData:(NSData *)data encoding:(MSDataEncoding)encoding {
	CFStringRef decodeType;
	switch (encoding) {
		case MSNoDataEncoding:
			return [self dataWithData:data];
			break;
		case MSBase32DataEncoding:
			decodeType = kSecBase32Encoding;
			break;
		case MSBase64DataEncoding:
			decodeType = kSecBase64Encoding;
			break;
	}

	NSData *decodedData = nil;
	SecTransformRef decodeTransform = SecDecodeTransformCreate(decodeType, NULL);
	if (decodeTransform) {
		SecTransformSetAttribute(decodeTransform, kSecTransformInputAttributeName, (CFDataRef)data, NULL);
		decodedData = [(NSData *)SecTransformExecute(decodeTransform, NULL) autorelease];
		CFRelease(decodeTransform);
	}

	return decodedData;
}

@end
