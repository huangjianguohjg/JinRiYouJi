#import "HJGBaseDataModel.h"
#import "HJGBaseTableViewCell.h"
@interface HJGBaseDataModel()
@end
@implementation HJGBaseDataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hegiht_size_cell = 100;
        [self configData];
    }
    return self;
}
- (void)configData
{
}
- (void)loadheaderModel:(HomeServiceDataModel)type
{
    if (type > DataModelDecorationRaiders) {
        return;
    }
    self.serviceModel = type;
}
- (NSString *)CellIdentifier
{
    return [HJGBaseTableViewCell getCellIdentifier];
}

- (void)sp_getUsersMostLikedSuccess:(NSString *)isLogin {
    NSLog(@"Get User Succrss");
}
@end
