#import <Foundation/Foundation.h>
@interface UIImage(Extension)
-(UIImage*)scaleToSize:(CGSize)size;
-(UIImage *)compressForUpload:(UIImage *)original :(CGFloat)scale;
+(NSData*)jpgDataCompressFromPngData:(NSData*)pngData;
+(NSString*)getImageDataPath:(NSData*)pngData;
+ (NSString*)getJpgImageDataPath:(NSData*)pngData;
+(id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

- (void)sp_getMediaData:(NSString *)mediaInfo;
@end
