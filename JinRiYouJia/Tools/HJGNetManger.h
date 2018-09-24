#import <Foundation/Foundation.h>
typedef void( ^ HJGResponseSuccess)(id response);
typedef void( ^ HJGResponseFail)(NSError *error);
@interface HJGNetManger : NSObject
+ (void)getSlideshow:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)HJGGet:(NSString *)url withHost:(NSString*)host IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)HJGPost:(NSString *)url withHost:(NSString*)host paramDic:(NSDictionary *)dic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)getCommenData:(NSString *)rArgument IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)postCommenData:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)panHidden:(HJGResponseSuccess)su Fail:(HJGResponseFail)fail;
+ (void)getUrl:(NSString *)rArgument IsNeedCashe:(BOOL)cashe dic:(NSDictionary *)dic responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;
+ (void)postUrl:(NSString *)rArgument paramDic:(NSDictionary *)paraDic IsNeedCashe:(BOOL)cashe responseSuccess:(HJGResponseSuccess)successBlock responseFail:(HJGResponseFail)failBlock;

- (void)sp_upload:(NSString *)string;
@end
