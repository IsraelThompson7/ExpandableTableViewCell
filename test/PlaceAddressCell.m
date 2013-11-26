//
//  PlaceAddressCell.m
//  outing
//
//  Created by XPH on 13-1-16.
//  Copyright (c) 2013年 wuyanfeng. All rights reserved.
//

#import "PlaceAddressCell.h"

@implementation PlaceAddressCell

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

- (void)dealloc {
    [_detailLabel release];
    [super dealloc];
}
- (IBAction)detailClicked:(id)sender {
}
@end
