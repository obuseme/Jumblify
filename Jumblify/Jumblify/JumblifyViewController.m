//
//  ViewController.m
//  Jumblify
//
//  Created by Andy Obusek on 10/11/14.
//  Copyright (c) 2014 Tuts+. All rights reserved.
//

#import "JumblifyViewController.h"

@interface JumblifyViewController ()

@end

@implementation JumblifyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSString *)reverseString:(NSString *)stringToReverse
{
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[stringToReverse length]];

    [stringToReverse enumerateSubstringsInRange:NSMakeRange(0,[stringToReverse length])
                                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                     usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                         [reversedString appendString:substring];
                                     }];
    return reversedString;
}

- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(@"result");
        });
    });
}

@end
