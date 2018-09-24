#import <UIKit/UIKit.h>
@interface CJHUD : UIView
+(void)show:(UIView*)childView;
+(void)showBottom:(UIView*)childView;
+(void)hide;
+ (void)showClearView:(UIView *)childView;
+(void)showController:(UIViewController*)controller;
+(void)showView:(UIView*)childView;
+(void)showView:(UIView*)childView beginYPos:(float)yPos;

- (void)sp_getUserFollowSuccess;
@end
