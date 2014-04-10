//
//  Spend.h
//  DailySpent
//
//  Created by Moises Quineche on 4/9/14.
//  Copyright (c) 2014 Moises Quineche. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Spend : NSManagedObject

@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSDate * createdDate;

@end
