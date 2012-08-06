#import "AppDelegate.h"
#import "ViewController.h"
#import "AppleMainViewController.h"
#import "GoogleMainViewController.h"
#import "GoogleWebViewController.h"
#import "DataConnect.h"
#import "Commons.h"

//MainView에서 GoogleMain과 AppleMain으로 이동하는데 사용.
//GoogleMain과 AppleMain에서 MainView로 이동하는데 사용.
AppDelegate * delegate()
{
    return [[UIApplication sharedApplication] delegate];
}

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize appleMainViewController;
@synthesize googleMainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) changeView_Main:(UIView *)currentView
{
    [currentView removeFromSuperview];
    [_window addSubview:self.viewController.view];
    [_window makeKeyAndVisible];
    
    self.window.rootViewController = self.viewController;

}

#pragma mark -
#pragma mark === Apple Delegate ===

- (void) changeView_Apple:(UIView *)currentView subView:(int)appleSubView state:(int)state 
{
    if(self.appleMainViewController != nil)
    {
        [self setAppleMainViewController:nil];
    }
    self.appleMainViewController = [[AppleMainViewController alloc] initWithNibName:@"AppleMainViewController" bundle:nil];
    self.appleMainViewController.selectedSubView = appleSubView;

	//오프라인 상태일 때 appleMainView를 로드시 세팅되는 서브뷰가 틀리기 때문에 사용함.
    if(state == STATE_OFFLINE)
    {
        self.appleMainViewController.isOffline = YES;
    }
    
    [currentView removeFromSuperview];
    [_window addSubview:self.appleMainViewController.view];
    [_window makeKeyAndVisible];
    
    self.window.rootViewController = self.appleMainViewController;
    //statusbar size 20px만큼 내림. rootView를 변경할때는 항상 이동됨.
    //여기서 문제가, subview 이동시 확신이 없다는 것.
    [self.window.rootViewController.view setFrame:[[UIScreen mainScreen] applicationFrame]];
}


#pragma mark -
#pragma mark === Google Delegate ===

- (void) changeView_Google:(UIView *)currentView subView:(int)googleSubView
{
    if(self.googleMainViewController != nil)
    {
        [self setGoogleMainViewController:nil];
    }
    self.googleMainViewController = [[GoogleMainViewController alloc] initWithNibName:@"GoogleMainViewController" bundle:nil];
    self.googleMainViewController.selectedSubView = googleSubView;
    
    [currentView removeFromSuperview];
    [_window addSubview:self.googleMainViewController.view];
    [_window makeKeyAndVisible];
    
    self.window.rootViewController = self.googleMainViewController;
    [self.window.rootViewController.view setFrame:[[UIScreen mainScreen] applicationFrame]];
}
@end
