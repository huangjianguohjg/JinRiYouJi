#import <Foundation/Foundation.h>
#define ISZHEN       @"iszhen"          
#define ISSHENG       @"isshengyin"     
@interface HJGSaveTool : NSObject
+ (void)setObject:(id)value forKey:(NSString *)defaultName;
+ (id)objectForKey:(NSString *)defaultName;
+ (void)setValue:(id)value forKey:(NSString *)defaultName;
+ (id)valueForKey:(NSString *)defaultName;
+(void)removeObjectForKey:(NSString*)key;
+(void)clearAll;

- (void)sp_getUsersMostLiked;
@end
