#import "NSMutableSet+Addition.h"
@implementation NSMutableSet(Addition)
- (void)addSafeObject:(id)object {
    if (object == nil || object == [NSNull null] || object == NULL) {
        return;
    }
    [self addObject:object];
}

- (void)sp_didGetInfoSuccess {
    NSLog(@"Get User Succrss");
}
@end
