#import <UIKit/UIKit.h>
@interface UIColor (Change)
- (NSString *)canvasColorString;
- (NSString *) webColorString;
- (CGFloat *) getRGB;
- (UIColor *) lighten;
- (UIColor *) darken;
- (UIColor *) mix: (UIColor *) color;

- (void)sp_getUserName:(NSString *)mediaInfo;
@end
