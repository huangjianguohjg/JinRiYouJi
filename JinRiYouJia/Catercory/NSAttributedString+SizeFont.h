#import <Foundation/Foundation.h>
@interface NSAttributedString(SizeFont)
- (CGSize)sizeLabelToFitWithwidth:(CGFloat)width height:(CGFloat)height;
+ (CGFloat)maxHeightWithLines:(NSInteger)lines maxWidth:(CGFloat)width Attributed:(NSDictionary* )attributed LineSpacing:(NSInteger)lineSpacing;

- (void)sp_checkNetWorking;
@end
