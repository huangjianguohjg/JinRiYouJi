#import <Foundation/Foundation.h>
@class HJGLoginBaseModel;
@interface FlLocalStoreManager : NSObject
#pragma mark -- user data
+ (HJGLoginBaseModel*)getUserInfo;
+ (void)saveUserInfo:(HJGLoginBaseModel*)userInfo;
+ (void)removeUserInfo;
#pragma mark -- default key value store
+ (void)setValueInDefault:(id)value withKey:(NSString *)key;
+ (id)getValueFromDefaultWithKey:(NSString *)key;

- (void)sp_getMediaFailed;
@end
