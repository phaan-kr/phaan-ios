#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, retain) AppleMainViewController *appleMainViewController;
@property (nonatomic, retain) GoogleMainViewController *googleMainViewController;

//c 코드로 delegate()	를 호출
AppDelegate * delegate();

- (void) changeView_Main:(UIView *)currentView;
- (void) changeView_Apple:(UIView *)currentView subView:(int)googleSubView state:(int)state;
- (void) changeView_Google:(UIView *)currentView subView:(int)googleSubView;

@end
