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

//GestureRecognizer can connect to View (like a controller)
@implementation YQSwipeGestureRecognizer {
    CGPoint startPoint;
    CGPoint currentPoint;
}
@synthesize towards;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    startPoint = [(UITouch *) [touches allObjects][0] locationInView:self.targetView];

    NSLog(@"start point: x:%f  y:%f", startPoint.x, startPoint.y);
    [(YQListViewController *)self.delegate touchesBegan:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    currentPoint = [(UITouch *) [touches allObjects][0] locationInView:self.targetView];

    if (self.towards == nil) {
        if (currentPoint.x > startPoint.x) {
            self.towards = @"right";
        } else {
            self.towards = @"left";
        }
    }
    NSLog(@"towards:%@", self.towards);



    NSLog(@"current point:%f", currentPoint.x);
    [(YQListViewController *)self.delegate touchesMoved:self];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [(YQListViewController *)self.delegate touchesEnded:self];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [(YQListViewController *)self.delegate touchesCancelled:self];
}

@end
