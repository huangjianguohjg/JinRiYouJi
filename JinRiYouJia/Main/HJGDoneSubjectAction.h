#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, HJGDoneSubjectType) {
    HJGDoneSubject_Home_Define, 
};
@interface HJGDoneSubjectAction : NSObject
@property (nonatomic, assign) HJGDoneSubjectType subject_type;
@property (nonatomic, strong) NSObject * info;
- (instancetype)initWithType:(HJGDoneSubjectType)type object:(NSObject *)object;

- (void)sp_getUsersMostLikedSuccess:(NSString *)mediaInfo;
@end
