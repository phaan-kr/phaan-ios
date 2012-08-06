	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",HOST]]];
    [request setHTTPMethod:@"POST"];
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=-------"];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [request setHTTPBody:body];

    NSData *returnValue = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog(@"returnValue", [[NSString alloc] initWithData:returnValue encoding:NSUTF8StringEncoding]);