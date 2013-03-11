//
//  YQListViewController.h
//  CAStudy
//
//  Created by hyq on 3/5/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQSwipeGestureRecognizer.h"

@interface YQListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *list;

- (void)touchesBegan:(YQSwipeGestureRecognizer *)gesture;

- (void)touchesMoved:(YQSwipeGestureRecognizer *)gesture;

- (void)touchesEnded:(YQSwipeGestureRecognizer *)gesture;

- (void)touchesCancelled:(YQSwipeGestureRecognizer *)gesture;


@end
