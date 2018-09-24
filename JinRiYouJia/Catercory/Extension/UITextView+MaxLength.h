#import <UIKit/UIKit.h>
typedef void(^TextViewLengthChangeBlock)(NSInteger currentLength);
@interface UITextView (MaxLength)
@property (nonatomic, assign) IBInspectable NSInteger maxLength;
@property (nonatomic, assign) IBInspectable NSInteger minLength;
@property (nonatomic, copy  ) IBInspectable NSString * placeholder;
@property (nonatomic, strong, readonly) UITextView * placeholderView;
@property (nonatomic, assign) NSInteger currentLength;
- (NSInteger)getRemainTextLength;
- (BOOL)isTextValide;

- (void)sp_getMediaFailed;
@end
