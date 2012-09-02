//
//  NSString+Anagram.m
//  AnagramKata
//
//  Created by Trevor Adams on 02/09/2012.
//  Copyright (c) 2012 Trevor Adams. All rights reserved.
//

#import "NSString+Anagram.h"

@implementation NSString (Anagram)

-(NSString*)stringBySortingCharactersAscending {
    NSMutableArray* letters = [NSMutableArray arrayWithCapacity:[self length]];
    for(NSUInteger i = 0; i < [self length]; i++){
        [letters addObject:[self substringWithRange:NSMakeRange(i, 1)]];
    }
    NSArray* sorted = [letters sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSString* sortedString = [sorted componentsJoinedByString:@""];
    
    return sortedString;
}

-(BOOL) isPermuationOf:(NSString *)candidate {
    if ([self length] != [candidate length]) {
        return NO;
    }
    NSString* candidateSorted = [candidate stringBySortingCharactersAscending];
    NSString* selfSorted = [self stringBySortingCharactersAscending];
    return [selfSorted isEqualToString:candidateSorted];
}


@end
