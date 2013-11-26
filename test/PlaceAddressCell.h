//
//  PlaceAddressCell.h
//  outing
//
//  Created by tripbe on 13-1-11.
//  Copyright (c) 2013年 seavision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceAddressCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *detailLabel;
- (IBAction)detailClicked:(id)sender;
@end
