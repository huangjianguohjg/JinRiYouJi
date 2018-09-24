#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSAttributedString (Utils)
-(NSMutableAttributedString *) changeStringColor:(NSString *)string secondString:(NSString *) string2 Color:(NSString *) color;
+ (NSAttributedString *)addLabelDeleteLine:(NSString *)labelStr;
- (NSMutableAttributedString *)changeAttributedStringColor:(NSString *)str withRangeOfStr:(NSString *)strColor;
+ (NSMutableAttributedString *)changeAttributedColorWithStr:(NSString *)str withExchangeColor:(UIColor *)color withRange:(NSRange)range;
+ (void)changeColorWithAttributed:(NSMutableAttributedString *)str withExchangeColor:(UIColor *)color withRange:(NSRange)range;
- (NSAttributedString *)changeLineSpace:(NSString *)labelStr withLineSpace:(CGFloat)lineSpace;
+ (NSMutableAttributedString *)changeAttributedFontWithString:(NSString *)str withFont:(UIFont *)font withRange:(NSRange)range;

- (void)sp_getLoginState;
@end
