//
//  YQListViewController.m
//  CAStudy
//
//  Created by hyq on 3/5/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import "YQListViewController.h"

@implementation YQListViewController {
    NSMutableArray *_data;
    UIGestureRecognizer        *_gobblerGestureRecognizer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _list.editing = YES;
        _data = [@[@"Chapter 1", @"Chapter 2", @"Chapter 3", @"Chapter 4", @"Chapter 5"] mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma datasource protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"line"];
    cell.textLabel.text = _data[indexPath.row];
    
    UISwipeGestureRecognizer *_leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellWasSwiped:)];
    _leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:_leftSwipe];
    
    UISwipeGestureRecognizer *_rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellWasSwiped:)];
    _rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:_rightSwipe];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma delegate protocol
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)cellWasSwiped:(UISwipeGestureRecognizer *)recognizer {
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft){
        //Swipe from right to left
        //Do your functions here
        NSLog(@"Swipe from right to left");
    }else{
        //Swipe from left to right
        //Do your functions here
        NSLog(@"Swipe from left to right");
    }
}

@end
