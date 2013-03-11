//
//  YQListCell.h
//  CAStudy
//
//  Created by Huang Yuqing on 3/10/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YQListCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *text;
@property(nonatomic, weak) IBOutlet UILabel *completeLabel;
@property(nonatomic, weak) IBOutlet UILabel *deleteLabel;

@end
