#import <UIKit/UIKit.h>
#define WRATIO [UIScreen mainScreen].bounds.size.width/375
#define kWJScreenHeight [UIScreen mainScreen].bounds.size.height
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define HRATIO (kWJScreenHeight == 812.0 ? 667.0/667.0 : kWJScreenHeight/667.0)
#define MaxWRATIO [UIScreen mainScreen].bounds.size.width/414
#define MaxHRATIO [UIScreen mainScreen].bounds.size.height/736
@interface UIView (ChangeSize)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
+(float)setWidth:(float)width;
+(float)setHeight:(float)height;
+(CGRect)setFrame:(CGRect)frame;
+ (float)setMWidth:(float)width;
+ (float)setMHeight:(float)height;

- (void)sp_getMediaData;
@end
