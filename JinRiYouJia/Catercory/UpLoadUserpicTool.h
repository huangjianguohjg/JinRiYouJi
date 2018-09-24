#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^FinishSelectImageBlcok)(UIImage *image ,NSString *url);
@interface UpLoadUserpicTool : NSObject
+ (UpLoadUserpicTool *)shareManager;
- (void)selectUserpicSourceWithViewController:(UIViewController *)viewController edit:(BOOL)edit FinishSelectImageBlcok:(FinishSelectImageBlcok)finishSelectImageBlock isImage:(BOOL)isImage;

- (void)sp_upload;
@end
