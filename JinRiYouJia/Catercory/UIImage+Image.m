#import "UIImage+Image.h"
#import <objc/message.h>
@implementation UIImage (Image)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextFillRect(ctx, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
#pragma mark - 类初次加载会调用
+ (void)load{
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
    Method HJGImageNamed = class_getClassMethod(self, @selector(HJGImageNamed:));
    method_exchangeImplementations(imageNamed, HJGImageNamed);
}
+ (UIImage *)HJGImageNamed:(NSString *)imageName{
    UIImage *image = [self HJGImageNamed:imageName];
    if (!image) {
    }else{
    }
    return image;
}
- (UIImage *)scaleToSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage; 
}

- (void)sp_checkNetWorking:(NSString *)string {
    NSLog(@"Get Info Success");
}
@end
