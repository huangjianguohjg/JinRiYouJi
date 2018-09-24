#import "UIView+AddAction.h"
@implementation UIView(AddAction)
- (void)addSimpleTapAction:(ActionBlock)action
{
    UITapGestureRecognizer * tapgesture = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:tapgesture];
}

- (void)sp_getUserFollowSuccess:(NSString *)mediaCount {
    NSLog(@"Check your Network");
}
@end
