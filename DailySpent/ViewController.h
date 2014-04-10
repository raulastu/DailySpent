//
//  ViewController.h
//  DailySpent
//
//  Created by Moises Quineche on 4/4/14.
//  Copyright (c) 2014 Moises Quineche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *detailInfo;

@end
