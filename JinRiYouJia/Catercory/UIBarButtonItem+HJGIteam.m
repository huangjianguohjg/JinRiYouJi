#import "UIBarButtonItem+HJGIteam.h"
@implementation UIBarButtonItem (HJGIteam)
+ (instancetype)itemWithNorImage:(NSString *)image frame:(CGRect)frame highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containVew = [[UIView alloc] initWithFrame:btn.bounds];
    [containVew addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:containVew];
}

- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Get Info Success");
}
@end
