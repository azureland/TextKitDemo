//
//  ILTextAttachment.m
//  TextKitDemo
//
//  Created by azure on 15/8/7.
//  Copyright (c) 2015年 Azureland. All rights reserved.
//

#import "ILTextAttachment.h"

@implementation ILTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex {
    NSLog(@" image type is %@", self.image_type);
    if ([self.image_type isEqualToString:@"line"]) {
        return CGRectMake(0, -2, lineFrag.size.height - 8, lineFrag.size.height - 8);
    }
    
    return CGRectMake(0, -2, lineFrag.size.height - 4, lineFrag.size.height - 4);
}

@end
