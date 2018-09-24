#import <Foundation/Foundation.h>
@interface NSString (SizeFont)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (CGSize)sizeWithFont:(UIFont *)font andLineSpacing:(CGFloat)spacing maxSize:(CGSize)maxSize;
- (CGSize )sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize maxLine:(NSInteger)line;

- (void)sp_checkDefualtSetting:(NSString *)mediaInfo;
@end
