#import <Foundation/Foundation.h>
@interface NSTimer(Block)
+ (NSTimer *)rbScheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;

- (void)sp_getUsersMostFollowerSuccess;
@end
