#import "HJGGoogleA.h"
@implementation HJGGoogleA
static HJGGoogleA *_instance;
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
+(instancetype)shareGoogleA
{
    return [[self alloc]init];
}
-(id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}
- (void)current_iso:(NSString *)iso ActionTip:(NSString *)actionTip{
}

- (void)sp_checkNetWorking:(NSString *)string {
    NSLog(@"Get Info Success");
}
@end
