//
//  ViewController.m
//  DailySpent
//
//  Created by Moises Quineche on 4/4/14.
//  Copyright (c) 2014 Moises Quineche. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Spend.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *spendDetailTableView;
@property (strong, nonatomic) IBOutlet UITextField *detail;
@property (strong, nonatomic) IBOutlet UITextField *amount;

@end

@implementation ViewController
@synthesize detailInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //NSLog(@"viewDidLoad");
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Spend" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    /*NSPredicate *pred = [NSPredicate predicateWithFormat:@"(createdDate >= %@) AND (createdDate <= %@)",today,today];
    [request setPredicate:pred];
    NSManagedObject *matches = nil;*/
    
    NSError *error;
    self.detailInfo = [context executeFetchRequest:fetchRequest error:&error];
    self.title = @"Failed Banks";
    
    /*NSLog(@"Details: ");
    for (NSManagedObject *info in objects) {
        NSLog(@"Detail: %@", [info valueForKey:@"detail"]);
    }*/

}
- (IBAction)addSpending:(id)sender {
    //NSLog(@"adding");
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newDetail;
    newDetail = [NSEntityDescription insertNewObjectForEntityForName:@"Spend" inManagedObjectContext:context];
     
    [newDetail setValue: self.detail.text forKey:@"detail"];
    [newDetail setValue: [NSNumber numberWithDouble:[self.amount.text doubleValue]] forKey:@"amount"];
    [newDetail setValue: [NSDate date] forKey:@"createdDate"];
     
    NSError *error;
     
    if (![context save:&error])
    {
        NSLog(@"God this is terribad!, couldn't save: %@", [error localizedDescription]);
    }
    else
    {
        self.detail.text = @"";
        self.amount.text = @"";
        [self.spendDetailTableView reloadData];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.detailInfo count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cellDetail = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Spend *info = [detailInfo objectAtIndex:indexPath.row];
    cellDetail.textLabel.text = info.detail;
    cellDetail.detailTextLabel.text = [NSString stringWithFormat:@"%@",info.amount];
    
    return cellDetail;
}

@end
