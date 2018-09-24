#import "NSBundle+Version.h"
@implementation NSBundle (Version)
+ (NSString*)releaseVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
+(NSString*)buildVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Check your Network");
}
@end
