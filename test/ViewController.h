//
//  ViewController.h
//  test
//
//  Created by tripbe on 13-3-25.
//  Copyright (c) 2013年 lkk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *mainTable;
    NSInteger endSection;
    NSInteger didSection;
    BOOL ifOpen;
}

@property (nonatomic,retain)NSMutableArray *array;

@end
