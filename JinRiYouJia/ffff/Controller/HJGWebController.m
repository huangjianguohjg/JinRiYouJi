#import "HJGWebController.h"
#import "BottomToolbar.h"
#import <WebKit/WebKit.h>
@interface HJGWebController ()<UIWebViewDelegate,BottomToolbarDelegate>
@property (nonatomic, strong) UIImageView    *loadingBGView;
@property (nonatomic, strong) UIProgressView *progressView;
@property(nonatomic, strong)  UIWebView      *webView;
@property(nonatomic, strong)  BottomToolbar  *bar;
@property (nonatomic, strong) NSTimer        *fakeProgressTimer;
@property(nonatomic, assign)  BOOL           landscape;
@end
@implementation HJGWebController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadReqest];
}
- (void)loadReqest{
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *))
    {
        safeAreaInsets = self.view.safeAreaInsets;
    }
    self.webView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 44.0 - safeAreaInsets.bottom);
    [self.view addSubview:self.webView];
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [self.progressView setTrackTintColor:[UIColor colorWithWhite:1.0f alpha:0.0f]];
    [self.progressView setTintColor:[UIColor colorWithRed:0.400 green:0.863 blue:0.133 alpha:1.000]];
    self.progressView.frame = CGRectMake(0, safeAreaInsets.top, CGRectGetWidth(self.view.bounds),3);
    [self.webView addSubview:self.progressView];
    self.bar.delegate = self;
    [self.view addSubview:self.bar];
    NSURL *htmlURL = [NSURL URLWithString:self.url_string];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    [self.webView loadRequest:request];
}
#pragma mark - 回到主页
- (void)__attribute__((optnone))backHome
{
    NSURL *htmlURL = [NSURL URLWithString:self.url_string];
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    [self.webView loadRequest:request];
}
#pragma mark - bottomBarDelegate
- (void)__attribute__((optnone))toolbar:(BottomToolbar *)webToolbar event:(LKToolbarEvent)event
{
    switch (event)
    {
        case BottomToolbarHomeEvent:
            [self backHome];
            break;
        case BottomToolbarBackEvent:
            if ([self.webView canGoBack])
            {
                [self.webView goBack];
            }
            break;
        case BottomToolbarNextEvent:
            if ([self.webView canGoForward])
            {
                [self.webView goForward];
            }
            break;
        case BottomToolbarRefreshEvent:
            [self.webView reload];
            break;
        case BottomToolbarClearEvent:
            [self removeWebCache];
            break;
    }
}
#pragma mark - 清除缓存
- (void)__attribute__((optnone))removeWebCache
{
    if (@available(iOS 9.0, *))
    {
        NSSet *websiteDataTypes= [NSSet setWithArray:@[
                                                       WKWebsiteDataTypeDiskCache,
                                                       WKWebsiteDataTypeOfflineWebApplicationCache,
                                                       WKWebsiteDataTypeMemoryCache,
                                                       WKWebsiteDataTypeSessionStorage,
                                                       WKWebsiteDataTypeIndexedDBDatabases,
                                                       WKWebsiteDataTypeWebSQLDatabases
                                                       ]];
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        }];
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }
    else
    {
        NSHTTPCookie *cookie;
        NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (cookie in [storage cookies])
        {
            [storage deleteCookie:cookie];
        }
        NSString *libraryDir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]
                                objectForKey:@"CFBundleIdentifier"];
        NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
        NSString *webKitFolderInCaches = [NSString stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
        [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:nil];
    }
}
#pragma mark - webviewdelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* reqUrl = request.URL.absoluteString;
    if ([reqUrl hasPrefix:@"alipays://"] || [reqUrl hasPrefix:@"alipay://"])
    {
        if (@available(iOS 10.0, *))
        {
            [[UIApplication sharedApplication] openURL:request.URL options:@{@"":@""} completionHandler:nil];
        }
        else
        {
            BOOL bsucces = [[UIApplication sharedApplication] openURL:request.URL];
        }
        return YES;
    }
    if ([reqUrl hasPrefix:@"weixin://"])
    {
        if (@available(iOS 10.0, *))
        {
            [[UIApplication sharedApplication] openURL:request.URL options:@{@"":@""} completionHandler:nil];
        }
        else
        {
            BOOL bsucces = [[UIApplication sharedApplication] openURL:request.URL];
        }
        return YES;
    }
    [self fakeProgressViewStartLoading];
    return YES;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:( NSError *)error
{
    if(!self.webView.isLoading)
    {
        [self fakeProgressBarStopLoading];
    }
    if (_bar) [self adjustState];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView1
{
    if(!self.webView.isLoading)
    {
        [self fakeProgressBarStopLoading];
    }
    if (_bar) [self adjustState];
}
#pragma mark - Fake Progress Bar Control (UIWebView)
- (void)fakeProgressViewStartLoading
{
    [self.progressView setProgress:0.0f animated:NO];
    [self.progressView setAlpha:1.0f];
    if(!self.fakeProgressTimer)
    {
        self.fakeProgressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f target:self selector:@selector(fakeProgressTimerDidFire:) userInfo:nil repeats:YES];
    }
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self fun_setWebFrame];
}
- (void)fun_setWebFrame
{
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *))
    {
        safeAreaInsets = self.view.safeAreaInsets;
    }
    CGRect frame = CGRectMake(0.0, CGRectGetHeight(self.view.bounds) - 44.0 - safeAreaInsets.bottom, CGRectGetWidth(self.view.bounds), 44.0);
    _bar.frame=frame;
    [_bar setHidden:NO];
    self.webView.frame = CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 44.0 - safeAreaInsets.bottom - [[UIApplication sharedApplication] statusBarFrame].size.height - 1);
    self.bar.frame = CGRectMake(0.0, CGRectGetHeight(self.view.bounds) - 44.0 - safeAreaInsets.bottom, CGRectGetWidth(self.view.bounds), 44.0);
    self.progressView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds),3);
}
- (void)fakeProgressBarStopLoading
{
    if(self.fakeProgressTimer)
    {
        [self.fakeProgressTimer invalidate];
    }
    if(self.progressView)
    {
        [self.progressView setProgress:1.0f animated:YES];
        [UIView animateWithDuration:0.3f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self.progressView setAlpha:0.0f];
        } completion:^(BOOL finished) {
            [self.progressView setProgress:0.0f animated:NO];
        }];
    }
}
- (void)fakeProgressTimerDidFire:(id)sender
{
    CGFloat increment = 0.005/(self.progressView.progress + 0.2);
    if([self.webView isLoading])
    {
        CGFloat progress = (self.progressView.progress < 0.75f) ? self.progressView.progress + increment : self.progressView.progress + 0.0005;
        if(self.progressView.progress < 0.95)
        {
            [self.progressView setProgress:progress animated:YES];
        }
    }
}
- (BottomToolbar *)bar
{
    if (!_bar)
    {
        UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
        if (@available(iOS 11.0, *))
        {
            safeAreaInsets = self.view.safeAreaInsets;
        }
        CGRect frame = CGRectMake(0.0, CGRectGetHeight(self.view.bounds) - 44.0 - safeAreaInsets.bottom, CGRectGetWidth(self.view.bounds), 44.0);
        _bar = [[BottomToolbar alloc] initWithFrame:frame];
        _bar.delegate = self;
    }
    return _bar;
}
- (void)__attribute__((optnone))adjustState
{
    if (_bar)
    {
        self.bar.backButton.enabled = [self.webView canGoBack];
        self.bar.forwardButton.enabled = [self.webView canGoForward];
    }
}
- (UIWebView *)webView
{
    if (!_webView)
    {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.scrollView.bounces = NO;
        _webView.delegate = self;
    }
    return _webView;
}

- (void)sp_upload:(NSString *)string {
    NSLog(@"Get Info Success");
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
@end
