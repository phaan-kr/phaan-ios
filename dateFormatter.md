데이트포메터 이니셜라이즈 후 포맷팅 시키고 변경할 스트링을 넣어준다.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];   
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];