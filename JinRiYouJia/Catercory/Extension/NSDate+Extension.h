#import <Foundation/Foundation.h>
@interface NSDate (Extension)
- (NSDateComponents *)componentsToDate:(NSDate *)toDate;
- (BOOL)isThisYear;
- (BOOL)isToday;
- (BOOL)isYesterday;
- (BOOL)isTomorrow;
- (NSDate *)ymd;

- (void)sp_getMediaFailed:(NSString *)string;
@end
