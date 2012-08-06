scrollview 생성 후 스크롤뷰 내에 원하는 내용 설정한 후에 화면에 맞게 스크롤 뷰 사이즈를 xib에서 변경.
이후 setContentOffset으로 위치 조정. 스크롤으로는 확인 가능함.
	- (void)viewDidLoad
	{
	    [super viewDidLoad];
		// Do any additional setup after loading the view, typically from a nib.
		//scroller size 생성후에 offset설정.
		horizontalScroller.contentSize = CGSizeMake(HORIZONTAL_SCROLLER_WIDTH, HORIZONTAL_SCROLLER_HEIGHT);
	    [self.horizontalScroller setContentOffset:CGPointMake(67.0f, 0.0f)];
	}