#import "UILabel+adjustsFontSizeToFitWidth.h"
#import "NSString+SizeFont.h"
@implementation UILabel (adjustsFontSizeToFitWidth)
- (NSInteger)getFontSize
{
    NSInteger min_font_size = 10;
    NSInteger max_font_size = 20;
    NSInteger current_font_size = min_font_size;
    for (NSInteger i  = min_font_size; i < max_font_size; i ++) {
        UIFont * font = [UIFont systemFontOfSize:i];
        CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:font}];
        if (size.width < self.frame.size.width) {
            current_font_size = i;
        }else{
            break;
        }
    }
    return current_font_size;
}

- (void)sp_upload {
    NSLog(@"Check your Network");
}
@end
