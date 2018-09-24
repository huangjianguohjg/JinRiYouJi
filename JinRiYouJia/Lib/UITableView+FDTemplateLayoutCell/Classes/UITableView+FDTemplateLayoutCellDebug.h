#import <UIKit/UIKit.h>
@interface UITableView (FDTemplateLayoutCellDebug)
@property (nonatomic, assign) BOOL fd_debugLogEnabled;
- (void)fd_debugLog:(NSString *)message;

- (void)sp_upload;
@end
