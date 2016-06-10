//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Matt Amerige on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

#pragma mark - Private Methods
- (void)assembleSentence
{
    NSMutableString *sentence = [[NSMutableString alloc] initWithString:[self.words componentsJoinedByString:@" "]];
    [sentence appendString:self.punctuation];
    self.sentence = sentence;
}

- (BOOL)validWord:(NSString *)word
{
    if (([word isEqualToString:@""] || [word isEqualToString:@" "] || word == nil)) {
        return NO;
    }
    return YES;
}

- (BOOL)validPunctuation:(NSString *)punctuation
{
    NSString *validPunctuationString = @".?!,;:—";
    
    
    if (punctuation == nil || ![validPunctuationString containsString:punctuation]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)validIndex:(NSUInteger)index
{
    if (index < self.words.count) {
        return YES;
    }
    return NO;
}

#pragma mark - Public Methods

- (void)addWord:(NSString *)word
{
    // Do not add the word if it is equal to empty string, space or if word is nil
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

- (void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation
{
    if (words == nil || words.count == 0) {
        return;
    }
    
    if (![self validPunctuation:punctuation]) {
        return;
    }
    
    for (NSString *word in words) {
        if ([self validWord:word]) {
            [self.words addObject:word];
        }
    }
        
    self.punctuation = punctuation;
    
    [self assembleSentence];
}

- (void)removeWordAtIndex:(NSUInteger)index
{
    // Check for an index that exceeds the array bounds
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

- (void)insertWord:(NSString *)word atIndex:(NSUInteger)index
{
    if ([self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

- (void)replacePunctuationWithPunctuation:(NSString *)punctuation
{
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word
{
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}

@end



































