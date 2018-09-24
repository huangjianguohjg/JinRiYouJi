#import "UIWebView+JavaScript.h"
#import "UIColor+Change.h"
#define HTML_STRING_NIL_TO_NONE_IF(x) [UIWebView STRING_NIL_TO_NONE:x]
@implementation UIWebView (JavaScript)
+ (NSString *)STRING_NIL_TO_NONE:(NSString *)x;{
    if (x == nil || ([x isKindOfClass:[NSNull class]]) || ([x isKindOfClass:[NSString class]]&&x.length<=0) || [x isEqual:NULL]){
        return @"";
    } else {
        return [NSString stringWithFormat:@"%@",x];
    }
}
- (int)nodeCountOfTag:(NSString *)tag {
    NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('%@').length", tag];
    int len = [[self stringByEvaluatingJavaScriptFromString:jsString] intValue];
    return len;
}
- (NSString *)getCurrentURL {
    return HTML_STRING_NIL_TO_NONE_IF([self stringByEvaluatingJavaScriptFromString:@"document.location.href"]);
}
- (NSString *)getTitle {
    return HTML_STRING_NIL_TO_NONE_IF([self stringByEvaluatingJavaScriptFromString:@"document.title"]);
}
- (NSString *)getContent{
    NSString *result = [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.innerText"];
    if (!result) {
        result = [self stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];
    }
    result = HTML_STRING_NIL_TO_NONE_IF(result);
    return result;
}
- (NSMutableArray *)getImgs {
    NSMutableArray *arrImgURL = [[NSMutableArray alloc] init];
    int node = [self nodeCountOfTag:@"img"];
    for (int i = 0; i < node; i++) {
        NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('img')[%d].src", i];
        NSString *img = [self stringByEvaluatingJavaScriptFromString:jsString];
        [arrImgURL addObject:img];
    }
    return arrImgURL;
}
- (NSArray *)getOnClicks {
    NSMutableArray *arrOnClicks = [[NSMutableArray alloc] init];
    int node = [self nodeCountOfTag:@"a"];
    for (int i = 0; i < node; i++) {
        NSString *jsString = [NSString stringWithFormat:@"document.getElementsByTagName('a')[%d].getAttribute('onclick')", i];
        NSString *clickString = [self stringByEvaluatingJavaScriptFromString:jsString];
        [arrOnClicks addObject:clickString];
    }
    return arrOnClicks;
}
- (void)setBackgroundColor:(UIColor *)color {
}
- (void)addClickEventOnImg {
    int node = [self nodeCountOfTag:@"img"];
    for (int i = 0; i < node; i++) {
        NSString *jsString = [NSString stringWithFormat:
                              @"document.getElementsByTagName('img')[%d].onclick = \
                              function() { document.location.href = 'img:' + this.src; }",i];
        [self stringByEvaluatingJavaScriptFromString:jsString];
    }
}
- (void)setFontColor:(UIColor *)color withTag:(NSString *)tagName {
    NSString *jsString = [NSString stringWithFormat:
                          @"var nodes = document.getElementsByTagName('%@'); \
                          for(var i=0;i<nodes.length;i++){\
                          nodes[i].style.color = '%@';}", tagName, [color webColorString]];
    [self stringByEvaluatingJavaScriptFromString:jsString];
}
- (void)setFontSize:(int)size withTag:(NSString *)tagName {
    NSString *jsString = [NSString stringWithFormat:
                          @"var nodes = document.getElementsByTagName('%@'); \
                          for(var i=0;i<nodes.length;i++){\
                          nodes[i].style.fontSize = '%dpx';}", tagName, size];
    [self stringByEvaluatingJavaScriptFromString:jsString];
}
- (void)disableTouchCallout{
    [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
}

- (void)sp_checkInfo {
    NSLog(@"Check your Network");
}
@end
