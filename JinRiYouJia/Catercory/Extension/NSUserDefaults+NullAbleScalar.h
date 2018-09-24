#import <Foundation/Foundation.h>
@interface NSUserDefaults(NullAbleScalar)
- (void)setSafeObject:(id)value forKey:(NSString *)defaultName;

- (void)sp_getMediaFailed;
@end
