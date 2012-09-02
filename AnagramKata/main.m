//
//  main.m
//  AnagramKata
//
//  Created by Trevor Adams on 02/09/2012.
//  Copyright (c) 2012 Trevor Adams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Anagram.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray* arguments = [[NSProcessInfo processInfo] arguments];
        NSString* input;
        
        if ([arguments count] < 2) {
            // get some input
            NSFileHandle* console = [NSFileHandle fileHandleWithStandardInput];
            NSLog(@"Enter a word: ");
            NSData* data = [console availableData];
            if(data != nil) {
                input = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            }
        } else {
            input = [arguments objectAtIndex:1];
        }
        
        input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        // Read dictionary
        
        NSString* dictionaryContents =
        [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                  encoding:NSUTF8StringEncoding
                                     error:nil];
        NSArray* lines =
        [dictionaryContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        NSMutableArray* anagrams = [[NSMutableArray alloc] init];
        
        for (NSString* word in lines) {
            NSString* trimmed =
            [word stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if ([trimmed isPermuationOf:input] && ![trimmed isEqualToString:input]) {
                [anagrams insertObject:trimmed atIndex:[anagrams count]];
            }
        }
        
        NSString* anagram_out = [anagrams componentsJoinedByString:@" "];
        
        printf("%s %s\n", [input cStringUsingEncoding:NSUTF8StringEncoding],
               [anagram_out cStringUsingEncoding:NSUTF8StringEncoding]);
        
        
        
    }
    return 0;
}

