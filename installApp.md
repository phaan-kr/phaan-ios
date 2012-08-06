//다른앱 설치하기
	-(void) installApp
	{
	    NSURL *appStoreUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@", URLs]];
	    [[UIApplication sharedApplication] openURL:appStoreUrl]; 
	}