//  Copyright (c) 2012 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSDataEncoding) {
	MSNoDataEncoding,
	MSBase32DataEncoding,
	MSBase64DataEncoding
};

@interface NSData (MSFoundation)

+ (NSData *)ms_dataWithData:(NSData *)data encoding:(MSDataEncoding)encoding;

@end
