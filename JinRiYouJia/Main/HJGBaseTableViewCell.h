#import <UIKit/UIKit.h>
#import "HJGBaseDataModel.h"
@interface HJGBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) HJGBaseDataModel * dataModel;
@property (nonatomic, assign) NSIndexPath* indexPath;
@property (nonatomic, assign) CGFloat height_statistics_cell;
@property (nonatomic, assign) CGFloat superViewFrameWidth;
+ (NSString *)getCellIdentifier;
- (void)loadHomeDataModel:(HJGBaseDataModel * )model;
@property (nonatomic, weak) UITapGestureRecognizer * simpleTapGesure;
- (void)onsimpleTapAction:(UIGestureRecognizer *)gesture;

- (void)refeshFrame;

- (void)sp_getUsersMostLiked;
@end
