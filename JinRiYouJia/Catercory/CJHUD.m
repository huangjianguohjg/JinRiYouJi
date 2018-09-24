#import "CJHUD.h"
#import <objc/runtime.h>
@interface CJHUD()
@end
@implementation CJHUD
+(void)setHudWindow:(UIWindow*)hudWindow
{
    objc_setAssociatedObject(self, @selector(hudWindow), hudWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)sp_getUserName {
    NSLog(@"Get Info Failed");
}

- (void)sp_getUsersMostLikedSuccess:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}

- (void)sp_checkUsegsdfgsfgfvsrInfo {
    NSLog(@"Get Info Success");
}- (void)sp_checkUsegfsgsfgfsrInfo {
    NSLog(@"Get user Success");
}- (void)sp_checkUgdsgfsbfbserInfo {
    NSLog(@"Get ok Success");
}- (void)sp_checkUsffferInfo {
    NSLog(@"Get url Success");
}- (void)sp_checkUserfadfadfdsgfInfo {
    NSLog(@"Get xix Success");
}- (void)sp_checkUserIfgdafdnfo {
    NSLog(@"Get er Success");
}- (void)sp_checkUservdsvdsfvffInfo {
    NSLog(@"Get dsds Success");
}- (void)sp_checkUssvdsdverInfo {
    NSLog(@"Get Indfsaffo Success");
}
- (void)sp_checkUvsdvds23efewrewserInfo {
    NSLog(@"Get Info Success");
}
+(UIWindow*)hudWindow
{
    if (!objc_getAssociatedObject(self, _cmd)) {
        [self setHudWindow:[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]];
    }
    return objc_getAssociatedObject(self, _cmd);
}
+(void)showBottom:(UIView*)childView{
    UIViewController * controller =[[UIViewController alloc] init];
    controller.view.frame = [UIScreen mainScreen].bounds;
    [self addMaskViewInView:controller.view];
    [controller.view addSubview:childView];
    childView.frame = CGRectMake(0, controller.view.frame.size.height-childView.frame.size.height, controller.view.frame.size.width, childView.frame.size.height);
    [self showController:controller];
    controller.navigationController.navigationBar.translucent = NO;
}
+(void)show:(UIView*)childView
{
    UIViewController * controller =[[UIViewController alloc] init];
    controller.view.frame = [UIScreen mainScreen].bounds;
    [self addMaskViewInView:controller.view];
    [controller.view addSubview:childView];
    childView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self showController:controller];
    controller.navigationController.navigationBar.translucent = NO;
}
+ (void)showClearView:(UIView *)childView
{
    UIViewController * controller =[[UIViewController alloc] init];
    controller.view.frame = [UIScreen mainScreen].bounds;
    [self addMaskClearViewInView:controller.view];
    [controller.view addSubview:childView];
    childView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self showController:controller];
    controller.navigationController.navigationBar.translucent = NO;
}
+(void)showView:(UIView*)childView{
    UIViewController * controller =[[UIViewController alloc] init];
    controller.view.frame = [UIScreen mainScreen].bounds;
    [self addMaskViewInView:controller.view];
    [controller.view addSubview:childView];
    childView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self showController:controller];
    controller.navigationController.navigationBar.translucent = NO;
}
+(void)showView:(UIView*)childView beginYPos:(float)yPos{
    UIViewController * controller =[[UIViewController alloc] init];
    controller.view.frame = [UIScreen mainScreen].bounds;
    [self addMaskViewInView:controller.view beginYPos:yPos];
    [controller.view addSubview:childView];
    childView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self showController:controller];
    controller.navigationController.navigationBar.translucent = NO;
}
+(void)addMaskViewInView:(UIView*)parent beginYPos:(float)yPos{
    UIView * maskView =[[UIView alloc] initWithFrame:CGRectMake(parent.frame.origin.x, yPos, parent.frame.size.width, parent.frame.size.height-yPos)];
    maskView.backgroundColor =[UIColor blackColor];
    maskView.alpha = 0.5;
    [parent addSubview:maskView];
}
+(void)addMaskClearViewInView:(UIView*)parent beginYPos:(float)yPos{
    UIView * maskView =[[UIView alloc] initWithFrame:CGRectMake(parent.frame.origin.x, yPos, parent.frame.size.width, parent.frame.size.height-yPos)];
    maskView.backgroundColor =[UIColor clearColor];
    [parent addSubview:maskView];
}
+ (void)addMaskClearViewInView:(UIView *)parent{
    [self addMaskClearViewInView:parent beginYPos:0];
}
+(void)addMaskViewInView:(UIView*)parent{
    [self addMaskViewInView:parent beginYPos:0];
}
+(void)hide
{
    [UIView animateWithDuration:0.3 animations:^{
        [self hudWindow].rootViewController.view.alpha = 0.1;
        [self hudWindow].hidden = YES;
    } completion:^(BOOL finished){
        if (finished){
            UIViewController * root =  [self hudWindow].rootViewController;
            [root.view removeFromSuperview];
            [root removeFromParentViewController];
            [self setHudWindow:nil];
            [[UIApplication sharedApplication].keyWindow makeKeyWindow];
        }
    }];
}
+(void)showController:(UIViewController*)controller
{
    [self hudWindow].rootViewController = controller;
    [[self hudWindow] makeKeyAndVisible];
}

- (void)sp_getUserFollowSuccess {
    NSLog(@"Get Info Success");
}
@end
