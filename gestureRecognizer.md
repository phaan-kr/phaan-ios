   	- (void) hideKeyboard 
	{
	    UITextField *textField = (UITextField *)[self.view viewWithTag:firstResp];
	
	    //picker가 있을 때 textfield가 선택되면 수정
	    if([myPickerView superview] == nil)//myPickerView != nil && 
	    {
	        if(textField != nil && [textField isFirstResponder])
	        {
	            myTable.frame = CGRectMake(0, 0, 320, 410); 
	            [textField resignFirstResponder];  
	        }
	        
	    }  
	}
    
return YES로 관련된 gesture를 확인. 
	- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
	{
	    return YES;
	}

사용
    gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideBackView)];
    [self.webView addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.numberOfTouchesRequired = 1;
    gestureRecognizer.delegate = self;
    gestureRecognizer.cancelsTouchesInView = NO;
    
    gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;