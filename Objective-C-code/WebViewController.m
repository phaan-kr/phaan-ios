
#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView;

	- (void)viewDidLoad
	{
	    [super viewDidLoad];
		// Do any additional setup after loading the view.
	    self.view.backgroundColor = [UIColor clearColor];
	    [[UIApplication sharedApplication] setStatusBarHidden:YES];
	    isPortrait = YES;    
	}

#pragma mark - WebView

	- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
	{   
	    if(navigationType == UIWebViewNavigationTypeLinkClicked)
	    {
	        isLink = YES;
	    }
	    
	    NSString * href = [[request URL] absoluteString];
	    
	    NSRange textRange = [[[request URL] absoluteString] rangeOfString:@"/image/list"];
		if (textRange.location != NSNotFound && [[request URL] absoluteString] != nil) 
	    {
	        [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;
	        [self.webView reload];
	        
	        return NO;
	    }
	    
	    return YES;
	}
	
	- (void)webViewDidStartLoad:(UIWebView *)webView
	{
	    [HUD show:YES];
	}
	- (void)webViewDidFinishLoad:(UIWebView *)webView
	{
	    [HUD hide:YES];
	
	    if(self.isLocal)
	    {
	        NSString * params = [localDic objectForKey:@"params"];
	        [self.webView stringByEvaluatingJavaScriptFromString:
	        [NSString stringWithFormat:@"setValues(\"%@\");", params]];
	    }
	    else
	    {
	        [self.webView stringByEvaluatingJavaScriptFromString:
	         @"try{document.cookie='name=value';''+document.cookie;}catch(e){''+e}"];
	    }
	    
	}
	- (IBAction)closeWebView:(id)sender 
	{
	    [[UIApplication sharedApplication] setStatusBarHidden:NO];
	    [UIApplication sharedApplication].statusBarOrientation = UIInterfaceOrientationPortrait;
	    [self.view removeFromSuperview];
	}
	- (void)viewDidUnload 
	{
	    [super viewDidUnload];
	}

@end
