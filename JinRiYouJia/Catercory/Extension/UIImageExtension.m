#import "UIImageExtension.h"
#import "NSString+Addition.h"
#define compressRatio  (0.5f)
#define CacheDataName  @"cjcache.jpg"
@implementation UIImage(Extension)
-(UIImage*)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
-(UIImage *)compressForUpload:(UIImage *)original :(CGFloat)scale
{
    CGSize originalSize = original.size;
    CGSize newSize = CGSizeMake(originalSize.width * scale, originalSize.height * scale);
    UIGraphicsBeginImageContext(newSize);
    [original drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* compressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImage;
}
+(NSString*)getImageDataPath:(NSData*)jpgData{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",[NSString generateUUIDString]]];
    [jpgData writeToFile:filePath atomically:false];
    return filePath;
}
+ (NSString*)getJpgImageDataPath:(NSData*)pngData{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",[NSString generateUUIDString]]];
    [pngData writeToFile:filePath atomically:false];
    pngData = nil;
    UIImage * jpgImg =[UIImage imageWithContentsOfFile:filePath];
    NSData * jpgData = UIImageJPEGRepresentation(jpgImg, compressRatio);
    return [self getImageDataPath:jpgData];
}
+(NSData*)jpgDataCompressFromPngData:(NSData*)pngData
{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [cachePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",[NSString generateUUIDString]]];
    [pngData writeToFile:filePath atomically:false];
    pngData = nil;
    UIImage * jpgImg =[UIImage imageWithContentsOfFile:filePath];
    NSData * jpgData = UIImageJPEGRepresentation(jpgImg, compressRatio);
    jpgImg=nil;
    return jpgData;
}
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r
{
    int w = size.width;
    int h = size.height;
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, r, r);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    img = [UIImage imageWithCGImage:imageMasked];
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageMasked);
    return img;
}
static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0)
    {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh/2);  
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); 
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); 
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); 
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

- (void)sp_getMediaData:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}
@end
