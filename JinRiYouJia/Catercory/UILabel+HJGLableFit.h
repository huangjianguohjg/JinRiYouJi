#import <UIKit/UIKit.h>
@interface UILabel (HJGLableFit)
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
+ (UILabel *)lableWithTextColor:(UIColor *)textColor textFont:(CGFloat)font text:(NSString *)text;

- (void)sp_getUsersMostFollowerSuccess;
@end
