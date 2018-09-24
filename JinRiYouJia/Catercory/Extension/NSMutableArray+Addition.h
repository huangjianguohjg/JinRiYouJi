#import <Foundation/Foundation.h>
@interface NSMutableArray(Addition)
- (void)insertSafeObject:(id)anObject atIndex:(NSUInteger)index;
- (void)addSafeObject:(id)object;
- (void)removeSafeObjectAtIndex:(NSUInteger)index;
- (void)replaceSafeObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)exchangeSafeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (id)safeObjectAtIndex:(NSUInteger)index;

- (void)sp_checkUserInfo;
@end
