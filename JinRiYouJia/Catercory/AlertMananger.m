#import "AlertMananger.h"
@interface AlertMananger ()
@property(nonatomic, strong)UIAlertController *alertCol;
@property(nonatomic, strong)NSMutableArray *actionTitles;
@property(nonatomic,copy)AlertIndexBlock indexBlock;
@end
@implementation AlertMananger
+ (AlertMananger *)shareManager
{
    static AlertMananger *managerInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        managerInstance = [[self alloc] init];
    });
    return managerInstance;
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
- (AlertMananger *)creatAlertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelTitle:(NSString *)canceTitle otherTitle:(NSString *)otherTitle,...NS_REQUIRES_NIL_TERMINATION{
    self.alertCol = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    NSString *actionTitle = nil;
    va_list args;
    self.actionTitles = [NSMutableArray array];
    [self.actionTitles addObject:canceTitle];
    if (otherTitle) {
        [self.actionTitles addObject:otherTitle];
        va_start(args, otherTitle);
        while ((actionTitle = va_arg(args, NSString*))) {
            [self.actionTitles addObject:actionTitle];
        }
        va_end(args);
    }
    [self buildCancelAction];
    [self buildOtherAction];
    return [AlertMananger shareManager];
}
- (void)buildCancelAction{
    NSString *cancelTitle = self.actionTitles[0];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.indexBlock(0);
    }];
    [self.alertCol addAction:cancelAction];
}
- (void)buildOtherAction{
    for (int i = 0 ; i < self.actionTitles.count; i++) {
        if (i == 0)continue;
        NSString *actionTitle = self.actionTitles[i];
        UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.indexBlock) {
                self.indexBlock(i);
            }
        }];
        [self.alertCol addAction:action];
    }
}
- (void)showWithViewController:(UIViewController *)viewController IndexBlock:(AlertIndexBlock)indexBlock{
    if (indexBlock) {
        self.indexBlock = indexBlock;
    }
    [viewController presentViewController:self.alertCol animated:YES completion:^{
    }];
}

- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Check your Network");
}
@end
