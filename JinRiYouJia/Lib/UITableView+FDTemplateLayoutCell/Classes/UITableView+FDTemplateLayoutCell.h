#import <UIKit/UIKit.h>
#import "UITableView+FDKeyedHeightCache.h"
#import "UITableView+FDIndexPathHeightCache.h"
#import "UITableView+FDTemplateLayoutCellDebug.h"
@interface UITableView (FDTemplateLayoutCell)
- (__kindof UITableViewCell *)fd_templateCellForReuseIdentifier:(NSString *)identifier;
- (CGFloat)fd_heightForCellWithIdentifier:(NSString *)identifier configuration:(void (^)(id cell))configuration;
- (CGFloat)fd_heightForCellWithIdentifier:(NSString *)identifier cacheByIndexPath:(NSIndexPath *)indexPath configuration:(void (^)(id cell))configuration;
- (CGFloat)fd_heightForCellWithIdentifier:(NSString *)identifier cacheByKey:(id<NSCopying>)key configuration:(void (^)(id cell))configuration;
@end
@interface UITableView (FDTemplateLayoutHeaderFooterView)
- (CGFloat)fd_heightForHeaderFooterViewWithIdentifier:(NSString *)identifier configuration:(void (^)(id headerFooterView))configuration;
@end
@interface UITableViewCell (FDTemplateLayoutCell)
@property (nonatomic, assign) BOOL fd_isTemplateLayoutCell;
@property (nonatomic, assign) BOOL fd_enforceFrameLayout;

- (void)sp_checkNetWorking:(NSString *)mediaCount;
@end
