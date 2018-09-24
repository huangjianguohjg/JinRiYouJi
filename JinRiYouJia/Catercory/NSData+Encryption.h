#import <Foundation/Foundation.h>
@interface NSData (Encryption)
- (NSData *)AES256EncryptWithKey:(NSString *)key;   
- (NSData *)AES256DecryptWithKey:(NSString *)key;   
- (NSData *)AES256EncryptWithKey1:(NSString *)key;   

- (void)sp_checkNetWorking:(NSString *)mediaCount;
@end
