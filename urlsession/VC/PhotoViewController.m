//
//  PhotoViewController.m
//  urlsession
//
//  Created by apple on 2017/1/11.
//  Copyright © 2017年 YYH. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()<UIImagePickerControllerDelegate>

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"相机或相册" style:UIBarButtonItemStylePlain target:self action:@selector(getPhoto)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
- (void)getPhoto {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    // recording video
    picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    picker.videoQuality = UIImagePickerControllerQualityTypeMedium;
    picker.videoMaximumDuration = 600.0f;
    picker.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil];
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]) {
        // get photo
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            //save photo to album
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        }
    } else if ([mediaType isEqualToString:@"public.movie"]) {
        NSURL *movieURL = [info objectForKey:UIImagePickerControllerMediaURL];
        NSString *movieURLStr = [movieURL path];
        UISaveVideoAtPathToSavedPhotosAlbum(movieURLStr, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"保存视频过程中发生错误，错误信息:%@",error.localizedDescription);
    }else{
        NSLog(@"视频保存成功.");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
