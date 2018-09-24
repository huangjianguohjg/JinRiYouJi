#import "NSDate+SwitchForm.h"
@implementation NSDate (SwitchForm)
+ (NSDate *)getDateFromString:(NSString *)date_string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"YYYY-MM-DD"];
    NSDate *dateTime = [formatter dateFromString:date_string];
    return dateTime;
}

- (void)sp_didUserInfoFailed {
    NSLog(@"Get User Succrss");
}
@end
