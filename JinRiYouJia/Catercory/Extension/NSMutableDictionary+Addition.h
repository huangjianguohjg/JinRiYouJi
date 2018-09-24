#import <Foundation/Foundation.h>
@interface NSMutableDictionary(Addition)
- (void)setSafeObject:(id)anObject forKey:(NSString *)key;
- (id)objectSafeForKey:(id)key;
@end
@interface NSDictionary(Addition)
- (id)objectSafeForKey:(id)key;
- (void)sp_upload:(NSString *)string;
@end
