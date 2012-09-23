    
	#pragma mark - UITableView

	- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
	{
	    return 150;
	}
	
	GroupCell header customizing
	
	- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
	{
		if(section==0){
			UILabel *label1 = (UILabel *)[viewHeader viewWithTag:1];
			label1.text = USER_NAME;
			return viewHeader;
		} else {
			return FALSE;
		}
	}
		
	numberOfRowsInSection	
	
	- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
	{
	    return [tableViewItems count];
	}

	cellForRowAtIndexPath	
	
	- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
	{
	    static NSString *CellIdentifier = @"cell";
	    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	    
	    if (cell == nil) 
	    {
	        [[NSBundle mainBundle] loadNibNamed:@"cell" owner:self options:nil];
	        cell = self.reservationCell;
	        self.reservationCell = nil;
	    }
	    
	    NSDictionary *info = [tableViewItems objectAtIndex:indexPath.row];
	    [info valueForKey:@"MA"];
	    [info valueForKey:@"QUA"] intValue]];
	    
	    if([[info valueForKey:@"NEW"] isEqualToString:@"YES"])
	    {
	        [editLabel setHidden:YES];
	        editingBtn = (UIButton *)[cell viewWithTag:1];
	        editingCount = 1;
	       
	        NSLog(@"editingCount %d", editingCount);
	    }
	    else
	    {
	        [(UIButton *)[cell viewWithTag:1] setTitle:@"" forState:UIControlStateNormal];
	    }
	    
	    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	    return cell;
	}
	