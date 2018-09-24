#import <UIKit/UIKit.h>
@interface UIBarButtonItem (Extension)
+ (instancetype)itemWithBgImage:(UIImage *)bgImage
                    highBgImage:(UIImage *)highBgImage
                         target:(id)target
                    imageInsets:(UIEdgeInsets)insets
                         action:(SEL)action;
+ (instancetype)itemWithBgImage:(UIImage *)bgImage
                  selectBgImage:(UIImage *)selectBgImage
                         target:(id)target
                    imageInsets:(UIEdgeInsets)insets
                         action:(SEL)action;
+ (instancetype)itemWithImage:(UIImage *)buttonImage
                  buttonTitle:(NSString *)title
                  buttonFrame:(CGRect)frame
                       target:(id)target
                       action:(SEL)action;
+ (instancetype)itemWithButtonTitle:(NSString *)title buttonColor:(UIColor *)color target:(id)target action:(SEL)action;
+(instancetype)getMoreItemWithTarget:(id)target action:(SEL)action;
+ (instancetype)getShareItemWithTarget:(id)target action:(SEL)action;
+ (instancetype)getEditItemWithTarget:(id)target action:(SEL)action;
+ (instancetype)itemWithButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action;

- (void)sp_getUserName;
@end
