	
	<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
	
	@property (retain, nonatomic) UIImagePickerController *cameraPicker;
	@property (strong, nonatomic) IBOutlet UIImageView *imageView;
	@property (strong, nonatomic) IBOutlet UIButton *captureBtn;

	#pragma mark - imagePickerController

사진 취소

	- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
	{
	    [picker dismissModalViewControllerAnimated:YES];
	    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
	}

용량 줄이기 위해서 사용했는데, 세로모드 가로모드일때 확인이 좀 더 필요함.

	-(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize
	{  
	    UIGraphicsBeginImageContext(newSize);  
	    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];  
	    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();  
	    UIGraphicsEndImageContext();    
	    return newImage;  
	}

//사진찍은 후

	- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
	{
	    [picker dismissModalViewControllerAnimated:YES];
	    uiImageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	
	    if([[[info valueForKey:@"PixelXDimension"] valueForKey:@"{Exif}"] valueForKey:@"960"])
	    {
	        uiImageView.image= [self scaleImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"] toSize:CGSizeMake(320.0, 480.0)];
	    }
	
	    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
	    
	    imageName = [[[info valueForKey:@"UIImagePickerControllerMediaMetadata"] valueForKey:@"{Exif}"] valueForKey:@"DateTimeOriginal"];
	    NSLog(@"%@ \n %@", info, imageName);
	}

//카메라 시작

	- (IBAction)onClickCaptureBtn:(id)sender 
	{
	    BOOL hasCamera=[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
	    if (hasCamera) 
	    {        
	        if(cameraPicker != nil)
	        {
	            [self setCameraPicker:nil];
	        }
	        self.cameraPicker = [[UIImagePickerController alloc] init];
	        self.cameraPicker.delegate = self;
	        self.cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
	                
	        [self presentModalViewController:self.cameraPicker animated:NO];   
	    }else {
	        [Commons showAlert:@"This device does not support a Photo."];
	    }
	}

//갤러리 읽어오기

	- (IBAction)onClickGallaryBtn:(id)sender 
	{
	    
	    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) 
	    {
	        if(cameraPicker != nil)
	        {
	            [self setCameraPicker:nil];
	        }
	        self.cameraPicker = [[UIImagePickerController alloc] init];
	        self.cameraPicker.delegate = self;
	        self.cameraPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	        [self presentModalViewController:cameraPicker animated:YES];
	    }
	    else 
	    {
	        [Commons showAlert:@"This device does not support a Photo Library."];
	    }
	}

