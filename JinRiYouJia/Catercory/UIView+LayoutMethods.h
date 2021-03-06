#import <UIKit/UIKit.h>
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define SCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)
@interface UIView (LayoutMethods)
- (CGFloat)l_height;
- (CGFloat)l_width;
- (CGFloat)l_x;
- (CGFloat)l_y;
- (CGSize)l_size;
- (CGPoint)l_origin;
- (CGFloat)l_centerX;
- (CGFloat)l_centerY;
- (CGFloat)l_bottom;
- (CGFloat)l_right;
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setHeight:(CGFloat)height;
- (void)heightEqualToView:(UIView *)view;
- (void)setWidth:(CGFloat)width;
- (void)widthEqualToView:(UIView *)view;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;
- (void)top:(CGFloat)top FromView:(UIView *)view;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)left:(CGFloat)left FromView:(UIView *)view;
- (void)right:(CGFloat)right FromView:(UIView *)view;
- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;
- (void)topEqualToView:(UIView *)view;
- (void)bottomEqualToView:(UIView *)view;
- (void)leftEqualToView:(UIView *)view;
- (void)rightEqualToView:(UIView *)view;
- (void)setSize:(CGSize)size;
- (void)sizeEqualToView:(UIView *)view;
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;
- (UIView *)topSuperView;
@end
@protocol LayoutProtocol
@required
- (void)calculateLayout;

- (void)sp_getUsersMostLikedSuccess;
@end
