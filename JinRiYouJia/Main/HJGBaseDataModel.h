#import <Foundation/Foundation.h>
#import "HJGDoneSubjectAction.h"
typedef NS_ENUM(NSInteger) {
    DataModelProductService = 1,
    DataModelDecorationCase,
    DataModelDesignGallery,
    DataModelDecorationRaiders,
}HomeServiceDataModel;
@class RACSignal;
@interface HJGBaseDataModel : NSObject
@property (nonatomic, assign) CGFloat hegiht_size_cell;
@property (nonatomic, assign) UIEdgeInsets cellEdgeInset;
@property (nonatomic, assign) HomeServiceDataModel serviceModel;
@property (nonatomic, assign) BOOL showBottomLine;
@property (nonatomic, assign) HJGDoneSubjectType done_subject_type;
- (void)loadheaderModel:(HomeServiceDataModel)type;
- (NSString *)CellIdentifier;

- (void)sp_getUsersMostLikedSuccess:(NSString *)isLogin;
@end
