화면 투명하게 만들기.    

	self.view.backgroundColor = [UIColor clearColor];	

statusbar 숨기기.

	[[UIApplication sharedApplication] setStatusBarHidden:YES];

키보드 사라지도록 만들기

    [self.view endEditing:YES];

Indigator를 나타낸 후 파일 전송하려고 했는데, 인디게이터가 돌기 이전에 파일 전송되고, 이후 인디게이터가 잠깐 나타나길래.
실행 순서를 알아내는게 맞겠지만,

	[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sendImages) userInfo:nil repeats:NO];

userInteraction 설정

	[editBtn setUserInteractionEnabled:NO];

button 설정

	[editBtn setImage:[UIImage imageNamed:@"buttonok.png"] forState:UIControlStateNormal];
	[slocBtn setBackgroundImage:[UIImage imageNamed:@"cursor.png"] forState:UIControlStateNormal];
	[(UIButton *)[[editBtn superview] viewWithTag:30] setHidden:YES];
	[[(UIButton *)[self.view viewWithTag:1] currentTitle]

label 설정       

	[(UILabel *)[[editBtn superview] viewWithTag:20] setText:@"editing"];

scroll 시작위치 설정. 화면내에 셀이 생성되어 있지 않다면 나타나지 않는게 함정.

	[tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
	
	UIView* qty  = self.qtyField;
	[qty becomeFirstResponder];
	
	if([[self.qtyField text] isEqualToString:@"0"])
	{
	   [self.qtyField setText:@""];
	}
        
셀 클릭시 색 변하지 않도록.

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
테이블 뷰에서 생성된 셀 안에 있는 뷰를 클릭했을시에 받는 메시지에서 몇번째 열인지 확인하기 위해서 사용

    UIButton *button = (UIButton *)sender;
    int row = [tableView indexPathForCell:(UITableViewCell *)[sender superview]].row;
    
뷰 움직임에 애니메이션을 줄 때

    - (void) setUpDown
	{
	    [UIView beginAnimations:nil context:NULL]; 
	    [UIView setAnimationDuration:0.2];    
	    if(isHidden)
	    {
	    	
	    }
	    else
	    {
	    	
	    }
	    
	    [UIView setAnimationDuration:0];    
	}
	
jsonValue 읽기 valueForKey로 읽어야 에러가 없었던듯.

    [title setValue:[[[[tables valueForKey:@"rows"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"TITLE"] forKey:@"TITLE"];

jsonValue가 숫자일 경우.

	[exportInfo valueForKey:@"QUA"] intValue]];
	        
정규식

	NSString *regex = @"[0-9]*";
	NSPredicate *regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	BOOL isValid = [regextest evaluateWithObject:str];
	
range내에 찾는 문자열이 있는지  

	NSRange range = [[params objectForKey:@"pwd"] rangeOfString:@" " options:NSRegularExpressionSearch];
	if (range.length > 0) 
	{
	    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"remove blank string." 
	     message:nil 
	    delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil,nil] autorelease];
	    [alert show];
	    return;
	}

encoding

	[request setHTTPBody:[submit.postBody dataUsingEncoding:NSUTF8StringEncoding]];
	URL_IMAGE = (NSMutableString*) [URL_IMAGE stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	NSMutableString *strData = [[[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding] autorelease];

//동적으로 셀높이 맞추기

	- (void) cellHeightSet
	{			
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 5, 210, 20)];
		[label setFont:[UIFont systemFontOfSize:14.0]];		
		[label setAdjustsFontSizeToFitWidth:NO];
		[label setNumberOfLines:0];
		[label setText:[NSString stringWithFormat:@"%@ %@",ARDDRESS1, ARDDRESS2]];
		[label sizeToFit];
		label.lineBreakMode = UILineBreakModeWordWrap;
		[self.view addSubview:label];
			
		float f;
		f = label.frame.size.height+16;
		if(f<30) f = 30;
		cellHeight = f;
		[label removeFromSuperview];
		[label release];
	}
