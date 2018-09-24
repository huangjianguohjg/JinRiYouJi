#import "NSTimer+Blocks.h"
@implementation NSTimer(Block)
+ (NSTimer *)rbScheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                        block:(void(^)())block
                                      repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];
}
+ (void)blockInvoke:(NSTimer*)timer{
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Get Info Failed");
}
@end
