//
//  YQListViewController.h
//  CAStudy
//
//  Created by hyq on 3/5/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQListView.h"

@interface YQListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *list;

@end
