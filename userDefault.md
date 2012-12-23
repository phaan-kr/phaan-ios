userDefault read & write

  {
  [NSUserDefaults standardUserDefaults] objectForKey:@"isFirst"];
  [[NSUserDefaults standardUserDefaults] setValue:@"NO" forKey:@"isFirst"];
  }
