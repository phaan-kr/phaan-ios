    
//부모뷰를 불러올 때 사용

    {
        MainViewController * main = (MainViewController *)[self.view.superview nextResponder];
        [main setDefaultImages];
        [main.workOrderBtn setImage:[UIImage imageNamed:@"main_menu.png"] forState:UIControlStateNormal];
        [main.horizontalScroller setContentOffset:CGPointMake(67.0f, 0.0f)];
        [self.view removeFromSuperview];
    }
