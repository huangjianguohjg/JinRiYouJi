#import <Foundation/Foundation.h>
@interface HJGBaseViewModel : NSObject
@property (nonatomic, weak, readonly) UIViewController * viewController;
+(HJGBaseViewModel *)modelWithViewController:(UIViewController *)viewController;
- (instancetype)initWithViewController:(UIViewController *)viewController;
- (void)initialize;

- (void)sp_getUsersMostLiked;
@end
