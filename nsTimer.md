더블 탭일때는 줌인 줌아웃이 되는데, 더블 탭이랑 그냥 탭 두번이랑 구분하기 위한 차이.
탭일때마다 뷰가 보이고 사라져야 하는데, 더블탭일때도 탭이 들어오니 무조건 나오는걸 방지하기 위해서. 다른방법은?

	- (void)hideBackView
	{
	    if(nsTimer == nil)
	    {
	        nsTimer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(showTime) userInfo:nil repeats:NO];
	        NSURL *baseUrl = [NSURL URLWithString:@"Just Tapping."];
	        [self.acarsWebView loadRequest:[NSURLRequest requestWithURL:baseUrl]];   
	    }
	    else {
	        nsTimer = nil;
	    }
	}
    
	- (void) showTime
	{
	    if(!isLink && nsTimer != nil)
	    {
	        if(ishidden){
	            ishidden = NO;
	            if(isPortrait)
	            {
	                [self.topViewLandscape setHidden:YES];
	                [self.topView setHidden:NO];
	                self.webScrollview.frame = CGRectMake(0, 44, 320, 436);
	            }
	            else {
	                [self.topView setHidden:YES];
	                [self.topViewLandscape setHidden:NO];
	                self.webScrollview.frame = CGRectMake(0, 44, 480, 320);
	            }
	        }
	        else {
	
	            [self.topView setHidden:YES];
	            [self.topViewLandscape setHidden:YES];
	
	            ishidden = YES;
	            self.webScrollview.frame = self.view.bounds;
	        } 
	        nsTimer = nil;
	    }
	    isLink = NO;
	}

return YES로 관련된 gesture를 확인. 

	- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
	{
	    return YES;
	}

UITapGestureRecognizer를 이용해서  gesture notification을 받는다. 

	- (void)viewDidLoad
	{
	    gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideBackView)];
	    [self.acarsWebView addGestureRecognizer:gestureRecognizer];
	    gestureRecognizer.numberOfTouchesRequired = 1;
	    gestureRecognizer.delegate = self;
	    gestureRecognizer.cancelsTouchesInView = NO;
	}
