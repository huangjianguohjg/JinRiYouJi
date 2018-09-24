#import "NSArray+Addition.h"
@implementation NSArray (Addition)
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

- (void)sp_getMediaData {
    NSLog(@"Continue");
}
@end
