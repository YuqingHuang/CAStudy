//
//  YQSwipeGestureRecognizer.m
//  CAStudy
//
//  Created by Huang Yuqing on 3/7/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import "YQSwipeGestureRecognizer.h"
#import "YQListViewController.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@implementation YQSwipeGestureRecognizer


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [(YQListViewController *)self.delegate touchesBegan:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [(YQListViewController *)self.delegate touchesMoved:self];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [(YQListViewController *)self.delegate touchesEnded:self];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [(YQListViewController *)self.delegate touchesCancelled:self];
}

@end
