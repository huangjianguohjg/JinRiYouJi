#import "NSString+SizeFont.h"
@implementation NSString (SizeFont)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    maxSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    maxSize = CGSizeMake(maxSize.width, maxSize.height );
    return maxSize;
}
- (CGSize )sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize maxLine:(NSInteger)line
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    maxSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    CGFloat height = [self sizeWithAttributes:attrs].height * line;
    height = MIN(maxSize.height, height);
    return CGSizeMake(maxSize.width, height);
}
- (CGSize)sizeWithFont:(UIFont *)font andLineSpacing:(CGFloat)spacing maxSize:(CGSize)maxSize{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spacing;
    NSDictionary *attrs = @{
                            NSFontAttributeName:font,
                            NSParagraphStyleAttributeName:paragraphStyle
                            };
    if (spacing == 0.0) {
        attrs = @{
                  NSFontAttributeName:font,
                  };
    }
    maxSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    maxSize = CGSizeMake(maxSize.width, maxSize.height );
    return maxSize;
}

- (void)sp_checkDefualtSetting:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}
@end
