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
    return CGRectMake(0, -2, lineFrag.size.height - 4, lineFrag.size.height - 4);
}

@end
