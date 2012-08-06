
	- (void) sorting
	{
	    [(UIButton *)[self.view viewWithTag:1] setTitle:[self.pickerItems objectAtIndex:[self.picker selectedRowInComponent:0]] forState:UIControlStateNormal];
	    selectedRow = [self.picker selectedRowInComponent:0];
	    
	    NSSortDescriptor *sorter;
	    
	    if([[(UIButton *)[self.view viewWithTag:1] currentTitle] isEqualToString:@"A"])
	    {
	        sorter = [[NSSortDescriptor alloc] initWithKey:@"A" ascending:NO];
	    }
	    else if([[(UIButton *)[self.view viewWithTag:1] currentTitle] isEqualToString:@"B"])
	    {
	        sorter = [[NSSortDescriptor alloc] initWithKey:@"B" ascending:YES];
	    }
	       
	    NSMutableArray *sortedItems = [[NSMutableArray alloc] initWithArray:self.array];
	    [sortedItems sortUsingDescriptors:[NSArray arrayWithObject:sorter]];
	    self.tableViewItems = sortedItems;
	    
	    [Commons reloadTableView:self.tableView];
	}