#import "NSDictionary+HJGDictionary.h"
@implementation NSDictionary (HJGDictionary)
- (NSArray *)nk_ascendingComparedAllKeys
{
    NSArray *allKeys = [self keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([obj1 integerValue] < [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    return allKeys;
}
- (NSArray *)nk_descendingComparedAllKeys
{
    NSArray *allKeys = [self keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] < [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        if ([obj1 integerValue] > [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    return allKeys;
}

- (void)sp_getUserFollowSuccess {
    NSLog(@"Get Info Success");
}
@end
