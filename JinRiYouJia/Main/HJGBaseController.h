#import <UIKit/UIKit.h>
@interface HJGBaseController : UIViewController
@property (nonatomic, strong) NSString *itemCode;
@property (nonatomic, assign) NSInteger itemClass;

- (void)sp_getUsersMostLiked;
@end
