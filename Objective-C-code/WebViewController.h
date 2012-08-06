#import <UIKit/UIKit.h>

@class MBProgressHUD;

@interface WebViewController : UIViewController
{
}

@property (retain, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)closeWebView:(id)sender;

@end
