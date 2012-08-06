addSubview를 하게되면 iphone 최상단에 맞춰서 subview가 불려오는데, center값을 받아서 위치를 이동.
지금 생각해보니깐 top을 받을 수 있으면 top을 받아서 계산하는게 편했을지도?
내가 기준을 맞출땐 상단을 기준으로했으니깐. 중앙값에서 상단값을 더했으니..

	- (void)setPosition :(UIView *) subView
	{
	    CGPoint subView_center = [subView center];
	    subView_center.y = SUBVIEW_POSITION;
	    [subView setCenter:subViewCenter];
	}

subMenu_apple: nib파일에 생성한 subView. 처음에 View load시에는 같이 불러오지 않고 있다가, addSubView로 불러온다.
	
	- (void)viewDidLoad
	{
	    [super viewDidLoad];
		// Do any additional setup after loading the view, typically from a nib.
	    [self.view addSubview:subMenu_apple];
	    
	    [self setSubMenuPosition:subMenu_apple];
	}