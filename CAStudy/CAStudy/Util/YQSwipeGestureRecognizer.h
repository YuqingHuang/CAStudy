//
//  YQSwipeGestureRecognizer.h
//  CAStudy
//
//  Created by Huang Yuqing on 3/7/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQSwipeGestureRecognizer : UISwipeGestureRecognizer

@property (nonatomic, weak) UIView *targetView;
@property(nonatomic, strong) NSString *towards;


@end
