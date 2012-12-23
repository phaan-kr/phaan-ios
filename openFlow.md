openflow initialize and addSubView.

	- (void)viewDidLoad
	{
	    [super viewDidLoad];
		// Do any additional setup after loading the view, typically from a nib.
			
		openFlow = [[AFOpenFlowView alloc] initWithFrame:CGRectMake(0, 30, 320, 410)];
	    [openFlow setDataSource:self];
	    [openFlow setViewDelegate:self];
	    [openFlow setNumberOfImages:COUNT_PAGE];
	    
	    if (selectedCover > 0) {
	        [openFlow setSelectedCover:selectedCover];
	    }else
	    {
	        [openFlow setSelectedCover:0];
	    }
	    
	    [openFlow centerOnSelectedCover:YES];
	    
	    [self.view addSubview:openFlow];
	
	    for (int i=0; i<5; i++) {
	        [flowView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"cover_%d.png", i+1]] forIndex:i];
	    }
	}

	#pragma mark -
	#pragma mark === OpenFlow Delegate ===

	- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidClick:(int)index 
	{    
	    if(isLogin)
	    {
	        selectedCover = index; 
	        switch (selectedCover) {
	            case 0:
	                [delegate() changeView_Apple:self.view subView:IPAD];
	                break;
	            case 1:
	                [delegate() changeView_Google:self.view subView:NEXUS];
	                break;    
	            case 2:
	                [delegate() changeView_MS];
	                break;
	            default:
	                break;
	        }
	    }
	}
	
	- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index
	{
	    index(image번호) 순서가 변경되면서 같이 변경되어야 하는 정보.
	}
