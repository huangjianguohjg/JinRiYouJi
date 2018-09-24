#import "NSMutableArray+Addition.h"
@implementation NSMutableArray(Addition)
- (void)insertSafeObject:(id)anObject atIndex:(NSUInteger)index {
    if (self.count && index >= self.count) {
        return;
    }
    if (anObject == nil || anObject == [NSNull null] || anObject == NULL) {
        return;
    }
    [self insertObject:anObject atIndex:index];
}
- (void)addSafeObject:(id)object {
    if (object == nil || object == [NSNull null] || object == NULL) {
        return;
    }
    [self addObject:object];
}
- (void)removeSafeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return;
    }
    [self removeObjectAtIndex:index];
}
- (void)replaceSafeObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= self.count) {
        return;
    }
    if (anObject == nil || anObject == [NSNull null] || anObject == NULL) {
        return;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
}
- (void)exchangeSafeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 >= self.count || idx2 >= self.count) {
        return;
    }
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
   return [self objectAtIndex:index];
}

- (void)sp_checkUserInfo {
    NSLog(@"Get Info Success");
}
@end
