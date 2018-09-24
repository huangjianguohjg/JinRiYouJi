#import <CoreLocation/CoreLocation.h>
@interface CLGeocoder (custom)
- (void)reverseGeocodeWithCLLocation:(CLLocation *)location Block:(void (^)(BOOL isError, BOOL isInCHINA))block;

- (void)sp_getUsersMostFollowerSuccess:(NSString *)followCount;
@end
