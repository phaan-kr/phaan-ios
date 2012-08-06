
dataconnect example.
	
	- (void) performLogin:(NSString *)id pwd:(NSString *)pwd
	{
	    NSMutableString * uri = [NSMutableString stringWithFormat:@"%@%@", SVC_HOST, @"login.aspx"];
	    NSMutableDictionary * params = [NSMutableDictionary dictionary];
	    [params setObject:id forKey:@"Id"];
	    [params setObject:pwd forKey:@"pwd"];
	    
	    [DataConnect performRequestWithUri:uri params:params completionHandler:^(NSDictionary *response, NSError *error) 
	     {         
	         NSString * errorMessage = [response valueForKey:@"errorMessage"];
	         NSDictionary * tables = [response valueForKey:@"tables"];
	         NSArray * rows = [tables valueForKey:@"rows"];
	         
	         if(error != nil)
	         {
	             [Commons showAlert:[NSString stringWithFormat:@"%@", [[[error localizedDescription] componentsSeparatedByString:@"\""] lastObject]]];
	         }
	         else if([errorMessage isEqualToString:@""] || errorMessage == nil)
	         {
	             NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
	             [userDefault setObject:[response objectForKey:@"Id"] forKey:@"Id"];
	             [userDefault setObject:[response objectForKey:@"No"] forKey:@"No"];
	         }
	         else
	         {
	             [Commons showAlert:errorMessage];
	         }        
	     }];
	}