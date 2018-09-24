#import <UIKit/UIKit.h>
typedef void(^ActionBlock)(UIGestureRecognizer * gesture);
@interface UIView(AddAction)
- (void)addSimpleTapAction:(ActionBlock)action;

- (void)sp_getUserFollowSuccess:(NSString *)mediaCount;
@end
