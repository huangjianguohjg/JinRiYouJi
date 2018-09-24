#import "NSDate+Extension.h"
@implementation NSDate (Extension)
- (NSDateComponents *)componentsToDate:(NSDate *)toDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:toDate options:0];
}
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    return nowYear == selfYear;
}
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitDay fromDate:[NSDate date].ymd toDate:self.ymd options:0].day == 0;
}
- (BOOL)isYesterday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:self.ymd toDate:[NSDate date].ymd options:0];
    return cmps.day == 1;
}
- (BOOL)isTomorrow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:self.ymd toDate:[NSDate date].ymd options:0];
    return cmps.day == -1;
}
- (NSDate *)ymd
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    return [fmt dateFromString:[fmt stringFromDate:self]];
}

- (void)sp_getMediaFailed:(NSString *)string {
    NSLog(@"Get Info Success");
}
@end
