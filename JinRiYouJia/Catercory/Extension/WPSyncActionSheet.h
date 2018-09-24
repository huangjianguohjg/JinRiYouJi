#import <UIKit/UIKit.h>
@interface WPSyncActionSheet : UIActionSheet
- (id)initWithTitle:(NSString *)title completion:(void(^)(UIActionSheet *theSheet, NSInteger buttonIndex))completion cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

- (void)sp_checkDefualtSetting;
@end
