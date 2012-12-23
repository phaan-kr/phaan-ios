	- (void)viewDidLoad
	{
	    [super viewDidLoad];
		// Do any additional setup after loading the view, typically from a nib.
		
	    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"show alert" 
	                                                    message:errorMessage                                                           
	                                                   delegate:self 
	                                          cancelButtonTitle:@"ok" 
	                                          otherButtonTitles:nil];
	    alert.tag = 1;
	    [alert show];
	                 
	}

alertView 생성 및 태그 설정 후에 show로 보여주게 되면, (안드로이드에서 toast띄울때 show 메서드 안부르면 안보이는 것과 마찬가지.)
버튼이 클릭될때 이 메시지가 호출됨.그래서 해당되는 조건문으로 이동. 실행.
exit(0)는 앱 종룐데, HIG에서 인정안한다고 그랬던듯.

	- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex 
	{
	    
	    if(alertView.tag == 1 ) // file download
	    {
	        if(buttonIndex == 0)
	        {
	            [self performSelectorInBackground:@selector(fileDownload:) withObject:self ];
	        }
	        else
	        {
	//            exit(0);
	        }
	    }
	}
