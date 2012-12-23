
set tableView background

	- (void)loadView {
	    
	    [super loadView];
	    
	    borrowItems = [self getBorrowItems];
	    lendItems = [self getLendItems];
	    
	    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_yellow.png"]];
	    [tempImageView setFrame:self.sharingView.frame];
	    
	    self.sharingView.backgroundView = tempImageView;
	}

	#pragma mark - UITableView

Number of Row

	- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
	{
	    return 2;
	}

Number of Rows in Section

	- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
	{
	    if(section == 0)
	    {
	        return [borrowItems count];
	    }
	    else{
	        return [lendItems count];
	    }
	    return 0;
	}

Header Title
	
	- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
	{
	    if(section == 0)
	    {
	        return @"A";
	    }
	    else
	    {
	        return @"B";
	    }
	
	    return @"";
	}

Row Height

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

create cell item programatically
	{
	        NSMutableDictionary *borrowItem = [borrowItems objectAtIndex:indexPath.row];
	        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 18)];
	        title.text = [borrowItem objectForKey:@"productName"];
	        title.textColor = [UIColor blackColor];
	        title.backgroundColor = [UIColor clearColor];
	        title.textAlignment = UITextAlignmentCenter;
	        title.font = [UIFont fontWithName:@"ArialMT" size:12];
	        [hlcell.contentView addSubview:title];
	        
	        UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 80, 18)];
	        price.text = [borrowItem objectForKey:@"pricePerDay"];
	        price.textColor = [UIColor blackColor];
	        price.backgroundColor = [UIColor clearColor];
	        price.textAlignment = UITextAlignmentCenter;
	        price.font = [UIFont fontWithName:@"ArialMT" size:12];
	        [hlcell.contentView addSubview:price];
	        
	        UILabel *state = [[UILabel alloc] initWithFrame:CGRectMake(240, 0, 80, 18)];
	        state.text = @"빌리는 중";
	        state.textColor = [UIColor redColor];
	        state.backgroundColor = [UIColor clearColor];
	        state.textAlignment = UITextAlignmentCenter;
	        state.font = [UIFont fontWithName:@"ArialMT" size:12];
	        [hlcell.contentView addSubview:state];
	        
		UIButton *button=[[UIButton alloc] initWithFrame:rect];
		[button setFrame:rect];
		UIImage *buttonImageNormal=[UIImage imageWithContentsOfFile:item.image];
		[button setBackgroundImage:buttonImageNormal    forState:UIControlStateNormal];
		[button setContentMode:UIViewContentModeCenter];
		[button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[hlcell.contentView addSubview:button];
	}
	
selector

	-(IBAction)buttonPressed:(id)sender
	{
		int tagId = [sender tag];
		
		UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
		BorrowViewController * borrowViewController = [sb instantiateViewControllerWithIdentifier:@"BorrowViewController"];
		[borrowViewController setIndexNum:tagId];
		[self.navigationController pushViewController:borrowViewController animated:YES];
	}
