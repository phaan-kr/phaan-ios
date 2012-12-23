
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	    
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	HUD.mode = MBProgressHUDModeIndeterminate;
    [self.view addSubview:HUD];
}
