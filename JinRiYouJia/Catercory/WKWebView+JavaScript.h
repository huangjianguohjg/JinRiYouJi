#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
@interface WKWebView (JavaScript)
- (void )getImgsCompletionHandler:(void(^)(NSArray * list))completion;

- (void)sp_checkNetWorking:(NSString *)followCount;
@end
