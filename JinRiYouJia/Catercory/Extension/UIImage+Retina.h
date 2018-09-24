#import <Foundation/Foundation.h>
@interface UIImage(Retina)
+ (UIImage *)loadImageByName:(NSString *)picName withExtenion:(NSString *)extenion;
+ (UIImage *)loadImageByName:(NSString *)picName;

- (void)sp_checkDefualtSetting;
@end
