#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, HJGImageAlignment) {
    HJGImageAlignmentLeft = 0,
    HJGImageAlignmentTop,
    HJGImageAlignmentBottom,
    HJGImageAlignmentRight,
};
@interface HJGButton : UIButton
@property(nonatomic,assign)HJGImageAlignment imageAlignment;
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;
@property(nonatomic,assign)CGFloat imageHeight;
@property(nonatomic,assign)CGFloat imageWidth;
@property(nonatomic, assign)CGFloat imageOrginX;

- (void)sp_didUserInfoFailed;
@end
