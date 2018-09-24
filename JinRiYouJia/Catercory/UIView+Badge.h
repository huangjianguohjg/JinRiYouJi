#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface BadgeBuilder: NSObject
@property (nonatomic, nullable) UIImage *image;
@property (nonatomic, nullable) NSNumber *number;
@property (nonatomic, nullable) UIColor *backgroundColor;
@property (nonatomic, nullable) UIFont *font;
@property (nonatomic, nullable) UIColor *textColor;
@property (nonatomic) CGSize size;
@property (nonatomic) CGPoint offset;
@end
@interface UITabBar (Badge)
- (UIView *)viewInTabbarAtIndex:(NSInteger)index;
@end
@interface UIView (Badge)
- (void)setBadge:(void(^)(BadgeBuilder *builder))buildHandler;

NS_ASSUME_NONNULL_END
- (void)sp_didGetInfoSuccess;
@end
