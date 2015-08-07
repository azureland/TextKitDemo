#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StrHeight : NSObject

+ (CGFloat)getTextHeight:(NSString *)str W:(NSInteger)width F:(NSInteger)font;

+ (CGFloat)getTextWidth:(NSString *)str font:(NSInteger)font;

@end
 