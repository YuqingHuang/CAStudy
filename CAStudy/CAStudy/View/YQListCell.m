//
//  YQListCell.m
//  CAStudy
//
//  Created by Huang Yuqing on 3/10/13.
//  Copyright (c) 2013 hyq. All rights reserved.
//

#import "YQListCell.h"

@implementation YQListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
