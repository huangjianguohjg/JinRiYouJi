#import "UpLoadUserpicTool.h"
#import "AlertMananger.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface UpLoadUserpicTool ()<UIActionSheetDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong)UIViewController *viewController;
@property (nonatomic, copy)FinishSelectImageBlcok imageBlock;
@end
@implementation UpLoadUserpicTool
+ (UpLoadUserpicTool *)shareManager
{
    static UpLoadUserpicTool *managerInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        managerInstance = [[self alloc] init];
    });
    return managerInstance;
}
- (void)selectUserpicSourceWithViewController:(UIViewController *)viewController edit:(BOOL)edit FinishSelectImageBlcok:(FinishSelectImageBlcok)finishSelectImageBlock isImage:(BOOL)isImage{
    if (viewController) {
        self.viewController = viewController;
    }
    if (finishSelectImageBlock) {
        self.imageBlock = finishSelectImageBlock;
    }
    if (@available(iOS 11, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    if (isImage) {
        UIImagePickerController* picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = edit;
        picker.navigationBar.tintColor = [UIColor whiteColor];
        picker.navigationBar.translucent=NO;
        [viewController presentViewController:picker animated:YES completion:nil];
    }else{
        @weakify_self;
        AlertMananger *alert = [[AlertMananger shareManager] creatAlertWithTitle:@"选择来源" message:@"" preferredStyle:UIAlertControllerStyleActionSheet cancelTitle:@"取消" otherTitle:@"拍照",@"相册", nil];
        [alert showWithViewController:viewController IndexBlock:^(NSInteger index) {
            @strongify_self;
            if (index == 1) {
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])return;
                UIImagePickerController* picker = [[UIImagePickerController alloc]init];
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.allowsEditing = NO;
                picker.delegate = self;
                [self.viewController presentViewController:picker animated:YES completion:nil];
            }else if (index == 2){
                UIImagePickerController* picker = [[UIImagePickerController alloc]init];
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                picker.allowsEditing = NO;
                picker.delegate = self;
                picker.navigationBar.translucent=NO;
                [viewController presentViewController:picker animated:YES completion:nil];
            }else{
            }
        }];
    }
}
#pragma mark - 相册/相机回调  显示所有的照片，或者拍照选取的照片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = nil;
    image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD showSuccessWithStatus:@"已选择图片"];
    NSString *str = [info objectSafeForKey:@"UIImagePickerControllerImageURL"];
    if (self.imageBlock) {
        self.imageBlock(image,str);
    }
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; 
    }
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if (@available(iOS 11, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; 
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)sp_upload {
    NSLog(@"Get Info Success");
}
@end
