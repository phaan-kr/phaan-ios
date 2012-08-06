webview Example
	- (void)viewDidLoad
	{
	    [super viewDidLoad];
	    // Do any additional setup after loading the view from its nib.
	
	    [WebView loadRequest:[NSURLRequest requestWithURL:url]];
	    [self.WebView setDataDetectorTypes:UIDataDetectorTypeNone];
	    [self.WebView setScalesPageToFit:NO];
	}