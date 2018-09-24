#import "UIImage+Retina.h"
@implementation UIImage(Retina)
+ (UIImage *)loadImageByName:(NSString *)picName withExtenion:(NSString *)extenion {
    NSString *fileName = nil;
    if ([UIScreen mainScreen].scale == 2.0) {
        fileName = [NSString stringWithFormat:@"%@@2x.%@", picName, extenion];
    } else if ([UIScreen mainScreen].scale == 3.0) {
        fileName =[NSString stringWithFormat:@"%@@3x.%@", picName, extenion];
    } else {
        fileName = [NSString stringWithFormat:@"%@.%@", picName, extenion];
    }
    NSString *path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath], fileName];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (image) {
        return image;
    } else {
        fileName = [NSString stringWithFormat:@"%@@2x.%@", picName, extenion];
        path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], fileName];
        image = [UIImage imageWithContentsOfFile:path];
        if (image) {
            return image;
        } else {
            return [UIImage imageNamed:[NSString stringWithFormat:@"%@.%@",picName,extenion]];
        }
    }
}
+ (UIImage *)loadImageByName:(NSString *)picName {
   return  [self loadImageByName:picName withExtenion:@"png"];
}

- (void)sp_checkDefualtSetting {
    NSLog(@"Get User Succrss");
}
@end
