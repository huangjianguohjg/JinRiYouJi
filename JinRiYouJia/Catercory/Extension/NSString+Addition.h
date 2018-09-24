#import <Foundation/Foundation.h>
@interface NSString(Addition)
+ (NSString *)changeDataToYear:(NSString *)data;
+ (BOOL)strIsNilOrEmpty:(NSString *)str;
+ (NSString *)getSafeStr:(NSString *)str;
+ (NSString *)strTrimSpace:(NSString *)text;
+(BOOL)judgePassWordLegal:(NSString *)text;
+ (NSString *)strTrimSpace:(NSString *)text withSymble:(NSString*)symble;
+ (NSString*)hiddMiddlePart:(NSString*)originStr;
- (BOOL)isNumber;
- (BOOL)isSpeailChar;
- (BOOL)isLetter;
- (BOOL)isAllChinese;
- (BOOL)isMoreThan50;
- (NSString *)md5String;
+ (const char *)UnicodeToISO88591:(NSString *)src;
- (BOOL)isContainChinese;
- (BOOL)isPureInt:(NSString*)string;
+ (id)changeStringtoJson:(NSString *)content;
+ (NSString *)generateUUIDString;
+ (NSString *)findKey:(NSString *)key source:(NSString *)source;
- (BOOL)isValidPhone;
- (BOOL)isValidSmsCode;
- (BOOL)isURLString;
- (NSString *) md5;
- (NSString *)wpTrim;
- (CGSize)lg_sizeWithFont:(UIFont *)font;
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (NSString *)replaceNewLine; 
- (BOOL)isEmail;
- (NSString *)cutStringWithLength:(NSInteger)length;
- (NSString *)urlDecode;
- (NSString *)urlEncode;
- (NSString *)urlEncodeNoSymbol;
- (NSURL *)urlValue;
- (NSString *)toBase64String;
- (NSString *)base64StringToOriginString;
- (NSString *)getNumWithString:(NSString *)string;
+ (int)yy_getSexWithString:(NSString *)str;
- (BOOL)isRightName;
+ (NSString *)getMoreSafeStr:(NSString *)str;
+ (NSString *)getChineseMonth:(NSUInteger )month;

- (void)sp_checkInfo:(NSString *)isLogin;
@end
