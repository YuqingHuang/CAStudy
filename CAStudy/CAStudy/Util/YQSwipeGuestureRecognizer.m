//
//  YQSwipeGuestureRecognizer.m
//  CAStudy
//
//  Created by Huang Yuqing on 3/7/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import "YQSwipeGuestureRecognizer.h"

@implementation YQSwipeGuestureRecognizer

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.delegate
    NSLog(@"touchesBegan:%@", self.delegate);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesMove");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnd");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesCancel");    
}


@end
