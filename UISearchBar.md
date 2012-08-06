	- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
	{
		//검색어 변경시 리스트 갱신
		[list_array removeAllObjects];
		NSString *upString = [searchText uppercaseString];
		for(int i=0 ; i<[data_array count] ; i++){
			ResponseDept *Dept = [data_array objectAtIndex:i];
					
			NSRange range =[[[[Dept.dtname componentsSeparatedByString:@" #"] objectAtIndex:0] uppercaseString] rangeOfString:upString];
			
			
			if(range.location != NSNotFound){			 			 
				[list_array addObject:Dept];
			}
			
		}
		[myTable reloadData];
	}
	
	- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
	{
		//searchMode = FALSE;
		[self.searchDisplayController setActive:NO animated:YES];
		
		[list_array removeAllObjects];
		[list_array addObjectsFromArray:data_array];
		
		[myTable reloadData];
		
	}