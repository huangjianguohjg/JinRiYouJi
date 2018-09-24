#import "WKWebView+JavaScript.h"
@implementation WKWebView (JavaScript)
- (void)nodeCountOfTag:(NSString *)tag completionHandler:(void(^)(int count))completion {
    NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('%@').length", tag];
    [self evaluateJavaScript:jsString completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        if (completion) {
            completion([data intValue]);
        }
    }];
}
- (void )getImgsCompletionHandler:(void(^)(NSArray * list))completion {
    NSString * run_json_content = @"function getImages() {let count = document.getElementsByTagName('img').length; var list = new Array();        for (var i = count - 1; i >= 0; i--) { let url = document.getElementsByTagName('img')[i].src;            list[i] = url;}        return list;    }\n getImages()";
    [self evaluateJavaScript:run_json_content completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        if (completion) {
            completion(data);
        }
    }];
}

- (void)sp_checkNetWorking:(NSString *)followCount {
    NSLog(@"Continue");
}
@end
