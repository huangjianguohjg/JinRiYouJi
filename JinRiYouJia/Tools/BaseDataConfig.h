#ifndef BaseDataConfig_h
#define BaseDataConfig_h
#define is_resiter_push @"is_resiter_push"
#define office_money_danwei  @"office_money_danwei"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <Masonry.h>
#define videoListUrl(Pages)  [NSString stringWithFormat:@"http://c.m.163.com/nc/video/list/V9LG4B3A0/y/%d-10.html",(Pages-1)*10]
#define parent_user_type @"parent_user_type"                 
#define fobid_words @"fobid_words"                          
#define defaultServe_host   @"defaultServe_host"
#define network_status   @"network_status"
#define newHost_fromGithub  @"newHost_fromGithub"
#define TCPMoney_change   @"TCPMoney_change"
#define MoneyEditCommen   @"MoneyEditCommen"
#define MoneyEditOffice   @"MoneyEditOffice"
#define APPColor [UIColor colorWithHexRGB:0xf6f6fa]
#define FontCommenColor [UIColor colorWithIntegerRed:63 green:63 blue:63]
#define FontSelectColor [UIColor colorWithIntegerRed:102 green:29 blue:172]
#define MW(float) [UIView setMWidth:(float)]
#define MH(float) [UIView setMHeight:(float)]
#define NW(float) MW(float * 1.15 / 3.0)
#define NH(float) MH(float * 1.15 / 3.0)
#define W(float) [UIView setWidth:(float)]
#define H(float) [UIView setHeight:(float)]
#define DefineSize(float) (float * 1.15 / 3.0) * 320.f / 414.f
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define F(float) [UIFont SHSystemFontOfSize:float/(96/72)]
#define kStatusBarHeight 20
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNavigationBarHeight (iPhoneX ? 44.f : 20.f)
#define kMarginTopHeight (iPhoneX ? 88.f : 64.f)
#define kTabBarHeight (iPhoneX ? (49.f+34.f) : 49.f)
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
#define RGB(r, g, b) RGBA(r,g,b,1)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS11_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_EARLIER    ( !IOS11_OR_LATER )
#define IOS9_OR_EARLIER     ( !IOS10_OR_LATER )
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)
#endif 
