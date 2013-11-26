//
//  ViewController.m
//  test
//
//  Created by tripbe on 13-3-25.
//  Copyright (c) 2013年 lkk. All rights reserved.
//

#import "ViewController.h"
#import "PlaceAddressCell.h"
#import "KKContactCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainTable.delegate = self;
    mainTable.dataSource = self;
    _array = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    didSection = _array.count+1;
    [self performSelector:@selector(firstOneClicked) withObject:self afterDelay:0.2f];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)firstOneClicked{
    didSection = 0;
    endSection = 0;
    [self didSelectCellRowFirstDo:YES nextDo:NO];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == didSection) {
        return 2;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        static NSString *CellIdentifier = @"PlaceAddressCell";
        
        PlaceAddressCell *cell=(PlaceAddressCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell==nil)
        {
            NSArray *nibs=[[NSBundle mainBundle] loadNibNamed:@"PlaceAddressCell" owner:self options:nil];
            for(id oneObject in nibs)
            {
                if([oneObject isKindOfClass:[PlaceAddressCell class]])
                {
                    cell = (PlaceAddressCell *)oneObject;
                }
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.detailLabel setText:@"asfssdsafsasfsaf"];
        }
        return cell;
    }
    else{
        static NSString *CellIdentifier = @"KKContactCell";
        
        KKContactCell *cell=(KKContactCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if(cell==nil)
        {
            NSArray *nibs=[[NSBundle mainBundle] loadNibNamed:@"KKContactCell" owner:self options:nil];
            for(id oneObject in nibs)
            {
                if([oneObject isKindOfClass:[KKContactCell class]])
                {
                    cell = (KKContactCell *)oneObject;
                }
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.titleLabel setText:@"asfssdsafsasfsaf"];
        }
        return cell;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == didSection) {
        return 45;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 110;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *mView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 110)]autorelease];
    [mView setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *logoView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 90, 90)];
    [logoView setImage:[UIImage imageNamed:[_array objectAtIndex:section]]];
    [mView addSubview:logoView];
    [logoView release];
    
    if (section<_array.count-1) {
        UIImageView *lineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 109, 320, 1)];
        [lineView setImage:[UIImage imageNamed:@"XX0022"]];
        [mView addSubview:lineView];
        [lineView release];
    }
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:CGRectMake(0, 0, 320, 110)];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bt setTag:section];
    [bt.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [bt.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [bt.titleLabel setTextColor:[UIColor blueColor]];
    [bt addTarget:self action:@selector(addCell:) forControlEvents:UIControlEventTouchUpInside];
    [mView addSubview:bt];
    return mView;
}
- (void)addCell:(UIButton *)bt{
    endSection = bt.tag;
    if (didSection==_array.count+1) {
        ifOpen = NO;
        didSection = endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    else{
        if (didSection==endSection) {
           [self didSelectCellRowFirstDo:NO nextDo:NO];
        }
        else{
            [self didSelectCellRowFirstDo:NO nextDo:YES];
        }
    }
}
- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert{
    [mainTable beginUpdates];
    ifOpen = firstDoInsert;
    NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:didSection];
    [rowToInsert addObject:indexPath];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:didSection];
    [rowToInsert addObject:indexPath1];
    if (!ifOpen) {
        didSection = _array.count+1;
        [mainTable deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [mainTable insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    [rowToInsert release];
    [mainTable endUpdates];
    if (nextDoInsert) {
        didSection = endSection;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    [mainTable scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (void)dealloc {
    [mainTable release];
    [super dealloc];
}
@end
