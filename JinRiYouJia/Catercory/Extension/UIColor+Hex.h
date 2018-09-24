#import <UIKit/UIKit.h>
@interface UIColor (Hex)
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

- (void)sp_checkNetWorking:(NSString *)followCount;
@end
