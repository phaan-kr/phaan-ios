	- (void) orientationChanged:(NSNotification *)notification
	{
	    NSLog(@"orientationChanged = %d", [[UIDevice currentDevice] orientation]);
	    [self willRotateToInterfaceOrientation:[[UIDevice currentDevice] orientation] duration:0];
	}

뱡향 전환이 notification을 통해서 메시지가 전달되면 orientationChanged 메시지 호출

	- (void)viewDidLoad
	{
	    [super viewDidLoad];
		// Do any additional setup after loading the view.
	    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
	    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
	}

방향에 따라서 뷰 세팅
	#define degreesToRadian(x)  ( M_PI * (x) / 180.0)

	-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
	{
	    [[UIApplication sharedApplication] setStatusBarHidden:YES];
	    if ( toInterfaceOrientation == UIInterfaceOrientationPortrait )
	    {
	        isPortrait = YES;
	        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;
	        self.view.transform = CGAffineTransformMakeRotation(0);
	        self.view.frame = CGRectMake(0,20,320,480);
	        [self.view setCenter:CGPointMake(160.0f, 240.0f)];
	    } 
	    else if ( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft )
	    {
	        isPortrait = NO;
	        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeLeft;
	        self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(-90)); //-90도 회전
	        CGRect contentRect = CGRectMake(0, 0, 320, 480); 
	        self.view.frame = contentRect; 
	        [self.view setCenter:CGPointMake(160.0f, 240.0f)];
	    } 
	    else if ( toInterfaceOrientation == UIInterfaceOrientationLandscapeRight )
	    {
	        isPortrait = NO;
	        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationLandscapeRight;
	        self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(90) );
	        CGRect contentRect = CGRectMake(0, 0, 320, 480); 
	        self.view.frame = contentRect; 
	        [self.view setCenter:CGPointMake(160.0f, 240.0f)];
	    }
	    else if ( toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown )
	    {
	        isPortrait = YES;
	        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortraitUpsideDown;
	        self.view.transform = CGAffineTransformMakeRotation(degreesToRadian(180));
	        self.view.frame = CGRectMake(0,-20,320,480); // 상태바 높이 20
	        [self.view setCenter:CGPointMake(160.0f, 240.0f)];
	    }    
	}
	
	- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
	{    
	    return YES;
	}
