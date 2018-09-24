#import <UIKit/UIKit.h>
@interface UIFont (HJGFont)
+ (UIFont *)SHSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)SHSystemFontOfSize:(CGFloat)fontSize weight:(CGFloat)weight;
+ (UIFont *)appTheme56pxMedium;
+ (UIFont *)appTheme58pxRegular;
+ (UIFont *)appTheme36Regular;
+ (UIFont *)appTheme42Regular;

- (void)sp_getMediaFailed;
@end
