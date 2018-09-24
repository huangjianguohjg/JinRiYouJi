#import <UIKit/UIKit.h>
@interface UIImage (Image)
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)scaleToSize:(CGSize)size;

- (void)sp_checkNetWorking:(NSString *)string;
@end
