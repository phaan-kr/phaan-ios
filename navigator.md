
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