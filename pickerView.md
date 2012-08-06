#pragma mark - PickerView

didSelectRow
	- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component 
	{
	    [(UIButton *)[self.view viewWithTag:2] setTitle:[pickerViewItems objectAtIndex:row] forState:UIControlStateNormal];
	}

title으로 설정 혹은 view로 설정
	//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
	//{
	//    return [pickerViewItems objectAtIndex:row];
	//}
	
	- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
	{
	    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 45)];
	    
	    [label setTextAlignment:UITextAlignmentCenter];
	    label.opaque=NO;
	    label.backgroundColor=[UIColor clearColor];
	    label.textColor = [UIColor blackColor];
	    UIFont *font = [UIFont boldSystemFontOfSize:20];
	    label.font = font;
	    
	    [label setText:[self.pickerViewItems objectAtIndex:row]];
	    
	    return label;
	}

numberOfComponentsInPickerView
	- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
	{
	    return 1;
	}

numberOfRowsInComponent
	- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
	{
	    return [pickerViewItems count];
	}
