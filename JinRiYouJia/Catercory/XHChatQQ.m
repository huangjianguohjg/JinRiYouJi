#import "XHChatQQ.h"
@interface XHChatQQ()
@end
@implementation XHChatQQ
+(BOOL)haveQQ
{
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]];
}
+(void)chatWithQQ:(NSString *)QQ
{
    NSString *url = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",QQ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)sp_checkInfo {
    NSLog(@"Get Info Failed");
}
@end
