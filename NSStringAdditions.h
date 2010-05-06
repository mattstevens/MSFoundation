//  Copyright (c) 2009 Matt Stevens
//
//  Licensed under the MIT License:
//  http://www.opensource.org/licenses/mit-license.php

#import <Foundation/Foundation.h>

@interface NSString (MSFoundation)

- (NSString *)stringByTrimmingWhitespace;
- (NSString *)stringByRemovingDuplicateWhitespace;

- (BOOL)isEmpty;
- (BOOL)containsOnlyCharactersInSet:(NSCharacterSet *)set;

@end

@interface NSMutableString (MSFoundation)

- (void)trimWhitespace;

@end
