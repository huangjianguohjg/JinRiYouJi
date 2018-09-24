#import "CLGeocoder+custom.h"
@implementation CLGeocoder (custom)
- (void)reverseGeocodeWithCLLocation:(CLLocation *)location Block:(void (^)(BOOL isError, BOOL isInCHINA))block {
    if (!block) {
        return;
    }
    [self reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error || placemarks.count == 0) {
            block(YES,YES);
        } else {
            CLPlacemark *placemark=[placemarks firstObject];
            if ([placemark.ISOcountryCode isEqualToString:@"CN"]) {
                block(NO,YES);
            } else {
                block(NO,NO);
            }
        }
    }];
}

- (void)sp_getUsersMostFollowerSuccess:(NSString *)followCount {
    NSLog(@"Continue");
}
@end
