//
//  NSTextAttachment+ILText.m
//  
//
//  Created by Ian Lan on 15/9/15.
//
//

#import "NSTextAttachment+ILText.h"
#import <objc/runtime.h>

@implementation NSTextAttachment (ILText)

- (NSString *)image_type {
    return objc_getAssociatedObject(self, @selector(image_type));
}

- (void)setImage_type:(NSString *)image_type {
    objc_setAssociatedObject(self, @selector(image_type), image_type, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
