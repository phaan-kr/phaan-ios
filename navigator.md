userStory 사용하게된 이후 userStory에서 navigation을 최상위 view로 만든 후 하위 뷰로 segue를 만들면
navigaion 사용 가능. 이후 segue로 이어지는 viewController에서는 자동으로 navigation을 사용.
하위 view로 넘어갈 때 넘길 파라미터가 필요하다거나, segue로 그낭 넘기기 애매할때  아래와 같이 사용.

	{
		UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
		GridViewController * gridViewController = [sb instantiateViewControllerWithIdentifier:@"GridViewController"];
		[gridViewController setCategoryNum:categoryNum];
		[self.navigationController pushViewController:gridViewController animated:YES];		
	}

navigation에서 하나 위의 뷰로 올라올 때 

	{
		[self.navigationController popViewControllerAnimated:YES];
	}

navigation에서 최상위로 올라올 때
	
	{
	        [self.navigationController popToRootViewControllerAnimated:YES];
	}
	
navigationController사용<br />

	appdelegate.h
	@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
	
	appdelegate.m
	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
	{    
		self.window.rootViewController = self.navigationController;
	    [self.window makeKeyAndVisible];
	
	    return YES;
	}
	
	rootViewController.m
	- (void)viewDidLoad 
	{
	    [super viewDidLoad];
		[self setTitle:@"HOME"];
		[self.navigationController setNavigationBarHidden:NO animated:NO];
		[self.navigationController setToolbarHidden:YES];
		
		self.navigationController.navigationBar.topItem.titleView = headerView;
		[headerView release];	
	}

navigation 사용

	ZipController *Controller = [[[ZipController alloc] initWithNibName:@"ZipController" bundle:nil] autorelease];
	UINavigationController *naviController = [[[UINavigationController alloc] initWithRootViewController:Controller] autorelease];
	[self.navigationController presentModalViewController:naviController animated:YES];


	Controller *Controller = [[[Controller alloc] initWithNibName:@"Controller" bundle:nil] autorelease];
	Controller.DATE = submitTime.chkDate;
	Controller.TIME = [params objectAtIndex:2];
	
	[self.navigationController pushViewController:Controller animated:YES];
	
	
controller 이동

	if(appleController != nil)
	    {
	        [self setAppleController:nil];
	    }
	    self.appleController = [[AppleController alloc] initWithNibName:@"AppleController" bundle:nil];
	    self.appleController.mainController = self;
	
	    [self.view addSubview:self.appleController.view];    
	    [(UIButton *)[self.appleController.view viewWithTag:1] setTitle:[Commons currentDateWithDash] forState:UIControlStateNormal];    
	    [self setSubViewPosition:self.appleController.view subViewPosition:SUBVIEW_POSITION];
	    [self.appleBtn setImage:[UIImage imageNamed:@"apple.png"] forState:UIControlStateNormal];
