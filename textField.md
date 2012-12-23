textFieldDidBeginEditing

	- (void)textFieldDidBeginEditing:(UITextField *)textField
	{
	    editingBtn = textField;
	    
	    UITableViewCell *cell = (UITableViewCell *)[textField superview];
	    editingRow = [mhTableView indexPathForCell:cell].row;
	    
	    if([(UITextField *)[[textField superview] viewWithTag:15] isFirstResponder] || [(UITextField *)[[textField superview] viewWithTag:14] isFirstResponder])
	    {
	        [self movePosition];
	    } 
	    	if(textField.tag>=13 && textField.tag <15)
	        [myTable setContentOffset:CGPointMake(0, 80) animated:YES];
		else if(textField.tag>=15 && textField.tag <22)
	        [myTable setContentOffset:CGPointMake(0, 210) animated:YES];
	    else if(textField.tag>=22)
	        [myTable setContentOffset:CGPointMake(0, 320) animated:YES];
	}
	- (void)textFieldDidEndEditing:(UITextField *)textField
	{
	    //    [textField resignFirstResponder];
	}

shouldChangeCharactersInRange	

	- (BOOL)textField:(UITextField *)inputTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
	{
	    //글자수제한
	    if(inputTextField.tag == 1 && [inputTextField.text length]>=3 && range.length == 0)
	    {
	        [params setObject:[inputTextField text] forKey:@"user1"];
			return NO;
		} 
	    else if(inputTextField.tag == 2 && [inputTextField.text length]>=4 && range.length == 0)
	    {
	        [params setObject:[inputTextField text] forKey:@"user2"];
			return NO;
		} 
	    else {
			return YES;
		}
	}

textFieldShouldReturn	

	-(BOOL)textFieldShouldReturn:(UITextField *)textField
	{    
	    if([(UITextField *)[[textField superview] viewWithTag:15] isFirstResponder] || [(UITextField *)[[textField superview] viewWithTag:14] isFirstResponder])
	    {
	        [self moveOriginPosition];
	        
	    } 
	    [textField resignFirstResponder];
	    return YES;
	}
