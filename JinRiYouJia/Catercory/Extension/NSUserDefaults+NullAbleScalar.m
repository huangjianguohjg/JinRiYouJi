#import "NSUserDefaults+NullAbleScalar.h"
@implementation NSUserDefaults(NullAbleScalar)
- (void)setSafeObject:(id)value forKey:(NSString *)defaultName {
    if (value == nil || value == [NSNull null] || value == NULL) {
        return;
    }
    [self setObject:value forKey:defaultName];
}

- (void)sp_getMediaFailed {
    NSLog(@"Get Info Failed");
}
@end
