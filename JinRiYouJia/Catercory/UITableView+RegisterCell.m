#import "UITableView+RegisterCell.h"
#import "HJGBaseTableViewCell.h"
@implementation UITableView (RegisterCell)
- (void)registerClass:(Class)aclass{
    NSString *Identifier = [aclass getCellIdentifier];
    [self registerClass:aclass forCellReuseIdentifier:Identifier];
}

- (void)sp_getUsersMostLikedSuccess {
    NSLog(@"Get Info Success");
}
@end
