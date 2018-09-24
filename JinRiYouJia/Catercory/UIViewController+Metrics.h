#import <UIKit/UIKit.h>
@interface UIViewController(Metrics)
@property(nonatomic) CGRect     frame;
@property(nonatomic) CGRect     bounds;
@property(nonatomic) CGSize     size;
@property(nonatomic) CGFloat    width;
@property(nonatomic) CGFloat    height;
@property(nonatomic) CGRect     viewFrame;
@property(nonatomic) CGRect     viewBound;
@property(nonatomic) CGSize     viewSize;
@property(nonatomic) CGFloat    viewWidth;
@property(nonatomic) CGFloat    viewHeight;

- (void)sp_checkDefualtSetting;
@end
