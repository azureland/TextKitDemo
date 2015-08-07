#import "StrHeight.h"

@implementation StrHeight

+ (CGFloat)getTextHeight:(NSString *)str W:(NSInteger)width F:(NSInteger)font{
    return ([str boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                              context:nil].size.height);
}

+ (CGFloat)getTextWidth:(NSString *)str font:(NSInteger)font {
    UIFont *fontText = [UIFont systemFontOfSize:font];
    CGSize maximumLabelSize = CGSizeMake(310, 9999);
    CGRect textRect = [str boundingRectWithSize:maximumLabelSize
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:fontText}
                                          context:nil];
    return textRect.size.width;
}

@end
