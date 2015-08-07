//
//  ILAttributedStringGenerator.h
//  TextKitDemo
//
//  Created by azure on 15/8/7.
//  Copyright (c) 2015年 Azureland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ILAttributedStringGenerator : NSObject

+ (ILAttributedStringGenerator *)sharedGenerator;

- (NSAttributedString *)generateAttributedStringWithArray:(NSArray *)array;

@end
