#import <Foundation/Foundation.h>
@interface NSDateFormatter (Category)
+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;
+ (id)defaultDateFormatter;

- (void)sp_getUserFollowSuccess;
@end
