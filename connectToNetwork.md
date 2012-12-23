network connection.  좀 더 확인할 것.

	- (BOOL) connectedToNetwork 
	{
	    
	    // 0.0.0.0 주소를 만든다.
	    struct sockaddr_in zeroAddress;
	    bzero(&zeroAddress, sizeof(zeroAddress));
	    zeroAddress.sin_len = sizeof(zeroAddress);
	    zeroAddress.sin_family = AF_INET;
		
	    // Reachability 플래그를 설정한다.
	    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	    SCNetworkReachabilityFlags flags;
		
	    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
	    CFRelease(defaultRouteReachability);
		
	    if (!didRetrieveFlags)
	    {
	        printf("Error. Could not recover network reachability flags\n");
	        return 0;
	    }
		
		// 플래그를 이용하여 각각의 네트워크 커넥션의 상태를 체크한다.
	    BOOL isReachable = flags & kSCNetworkFlagsReachable;
	    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
		BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
		
		return ((isReachable && !needsConnection) || nonWiFi) ? YES : NO;
	}
