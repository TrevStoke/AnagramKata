//
//  NSString+Anagram.h
//  AnagramKata
//
//  Created by Trevor Adams on 02/09/2012.
//  Copyright (c) 2012 Trevor Adams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Anagram)

-(NSString*) stringBySortingCharactersAscending;
-(BOOL) isPermuationOf:(NSString*)candidate;

@end
