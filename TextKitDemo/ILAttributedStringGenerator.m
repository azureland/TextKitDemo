//
//  ILAttributedStringGenerator.m
//  TextKitDemo
//
//  Created by azure on 15/8/7.
//  Copyright (c) 2015年 Azureland. All rights reserved.
//

#import "ILAttributedStringGenerator.h"
#import "ILTextAttachment.h"

@interface ILAttributedStringGenerator ()

@property (nonatomic, strong) ILTextAttachment *startImageAttachment;
@property (nonatomic, strong) ILTextAttachment *lineImageAttachment;
@property (nonatomic, strong) ILTextAttachment *endImageAttachment;

@property (nonatomic, strong) NSAttributedString *startImageString;
@property (nonatomic, strong) NSAttributedString *endImageString;
@property (nonatomic, strong) NSAttributedString *lineImageString;

@end

@implementation ILAttributedStringGenerator

#pragma mark - singleton
// 单例
+ (instancetype)sharedGenerator {
    static ILAttributedStringGenerator *_sharedGenerator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGenerator = [[ILAttributedStringGenerator alloc] init];
    });
    
    return _sharedGenerator;
}

#pragma mark - init


#pragma mark - private method
// 生成string
- (NSAttributedString *)generateAttributedStringWithArray:(NSArray *)anArray {
    
    // 返回的string
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName : paragraphStyle};
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"" attributes:attributes];
    
    __weak typeof(self)weakSelf = self;
    [anArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // 起点
        if (idx == 0) {
            [string appendAttributedString:weakSelf.startImageString];
        }
        
        // 终点
        if (idx == anArray.count - 1) {
            [string appendAttributedString:weakSelf.endImageString];
        }
        
        // 站台名
        [string appendAttributedString:[[NSAttributedString alloc] initWithString:obj]];
        
        // 不是终点, 加上线路指示
        if (idx != anArray.count - 1) {
            [string appendAttributedString:weakSelf.lineImageString];
        }
    }];
    
    return string;
}


#pragma mark - setter and getter
- (ILTextAttachment *)startImageAttachment {
    if (!_startImageAttachment) {
        _startImageAttachment = [[ILTextAttachment alloc] initWithData:nil ofType:nil];
        [_startImageAttachment setImage_type:@"start"];
        [_startImageAttachment setImage:[UIImage imageNamed:@"start"]];
    }
    return _startImageAttachment;
}

- (NSAttributedString *)startImageString {
    if (!_startImageString) {
        _startImageString = [NSAttributedString attributedStringWithAttachment:self.startImageAttachment];
    }
    return _startImageString;
}

- (ILTextAttachment *)endImageAttachment {
    if (!_endImageAttachment) {
        _endImageAttachment = [[ILTextAttachment alloc] initWithData:nil ofType:nil];
        [_endImageAttachment setImage_type:@"end"];
        [_endImageAttachment setImage:[UIImage imageNamed:@"end"]];
    }
    return _endImageAttachment;
}

- (NSAttributedString *)endImageString {
    if (!_endImageString) {
        _endImageString = [NSAttributedString attributedStringWithAttachment:self.endImageAttachment];
    }
    return _endImageString;
}


- (ILTextAttachment *)lineImageAttachment {
    if (!_lineImageAttachment) {
        _lineImageAttachment = [[ILTextAttachment alloc] initWithData:nil ofType:nil];
        [_lineImageAttachment setImage_type:@"line"];
        [_lineImageAttachment setImage:[UIImage imageNamed:@"line"]];
    }
    return _lineImageAttachment;
}

- (NSAttributedString *)lineImageString {
    if (!_lineImageString) {
        _lineImageString = [NSAttributedString attributedStringWithAttachment:self.lineImageAttachment];
    }
    return _lineImageString;
}


@end
