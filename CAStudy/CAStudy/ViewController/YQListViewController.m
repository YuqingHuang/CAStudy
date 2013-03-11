//
//  YQListViewController.m
//  CAStudy
//
//  Created by hyq on 3/5/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

//TODO: pinch to a line
#import "YQListViewController.h"
#import "YQListCell.h"

@implementation YQListViewController {
    NSMutableArray *_data;
    int step;
    int startLocation;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initNeededParameters];
        _data = [@[@"Chapter 1", @"Chapter 2", @"Chapter 3", @"Chapter 4", @"Chapter 5"] mutableCopy];
    }
    return self;
}

- (void)initNeededParameters {
    startLocation = 10;
    step = 5;
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
    YQListCell *cell = (YQListCell *)[tableView dequeueReusableCellWithIdentifier:@"YQListCell"];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YQListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.text.text = _data[indexPath.row];
    cell.deleteLabel.hidden = YES;
    cell.completeLabel.hidden = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    YQSwipeGestureRecognizer *swipeGestureRecognizer = [[YQSwipeGestureRecognizer alloc] initWithTarget:self action:nil];
    swipeGestureRecognizer.delegate = self;
    swipeGestureRecognizer.targetView = cell;
    [cell addGestureRecognizer:swipeGestureRecognizer];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma delegate protocol
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)touchesBegan:(YQSwipeGestureRecognizer *)gesture {
    NSLog(@"gesture:%@", gesture);

}

- (void)touchesMoved:(YQSwipeGestureRecognizer *)gesture {
    if([gesture.towards isEqualToString:@"right"]){
        YQListCell *currentCell = (YQListCell *) gesture.view;
        [UIView animateWithDuration:0 animations:^{
            currentCell.backgroundColor = [UIColor orangeColor];
            currentCell.completeLabel.hidden = NO;
            currentCell.text.frame = CGRectMake(startLocation+(step++), 0, 320-startLocation-step+1, 50);
        }];
    }else{
        YQListCell *currentCell = (YQListCell *) gesture.view;
        [UIView animateWithDuration:0 animations:^{
            currentCell.backgroundColor = [UIColor yellowColor];
            currentCell.deleteLabel.hidden = NO;
            currentCell.text.frame = CGRectMake(0, 0, 320-startLocation-(step++), 50);
        }];
    }
}

- (void)touchesEnded:(YQSwipeGestureRecognizer *)gesture {
    if(gesture.direction == UISwipeGestureRecognizerDirectionLeft){
        YQListCell *currentCell = (YQListCell *) gesture.view;
        [UIView animateWithDuration:1 animations:^{
            currentCell.text.frame = CGRectMake(0, 0, 320, 50);
        } completion:^(BOOL finished){
            [_data removeObjectAtIndex:[self.list indexPathForCell:currentCell].row];
            [self.list reloadData];
        }];
    }else{
        YQListCell *currentCell = (YQListCell *) gesture.view;
        [UIView animateWithDuration:1 animations:^{
            currentCell.text.frame = CGRectMake(0, 0, 320, 50);
        } completion:^(BOOL finished){
            [_data removeObjectAtIndex:[self.list indexPathForCell:currentCell].row];
            [self.list reloadData];
        }];
    }
    [self initNeededParameters];
}

- (void)touchesCancelled:(YQSwipeGestureRecognizer *)gesture {
    YQListCell *currentCell = (YQListCell *) gesture.view;
    [UIView animateWithDuration:0.1 animations:^{
        [self initNeededParameters];
        currentCell.completeLabel.hidden = YES;
        currentCell.deleteLabel.hidden = YES;
        currentCell.text.frame = CGRectMake(0, 0, 320, 50);
    }];
}

@end
