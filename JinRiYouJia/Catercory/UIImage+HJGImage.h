#import <UIKit/UIKit.h>
@interface UIImage (HJGImage)
-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;

- (void)sp_didUserInfoFailed;
@end
