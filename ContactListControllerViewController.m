//
//  ContactListControllerViewController.m
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import "ContactListControllerViewController.h"

@interface ContactListControllerViewController ()
// temporary method to initialize the cell's label with a sample string. later, it will need to show the contact's name and first name.
-(void)configureTextForCell:(UITableViewCell *)cell withItem:(Contact *)item;
@end

@implementation ContactListControllerViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    // for now this just overrides the method of UIviewcontroller and fills the array of this controller with references to the same contact
    // aDecoder is not yet used
    self = [super init];
    
    if (self) {
        self.contactList = [[NSMutableArray alloc] initWithCapacity:20];
        
        Contact *myContact = [Contact new];
        myContact.etatCivil.firstName = @"Gilles";
        myContact.etatCivil.lastName = @"Major";
        for (int i = 0; i < 20; i++) {
            [self.contactList addObject:myContact];
        }
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.contactList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell"];
    Contact *item = self.contactList[indexPath.row];
    
    [self configureTextForCell:cell withItem:item];
    
    return cell;
}

// implementation of class extension methods
-(void)configureTextForCell:(UITableViewCell *)cell withItem:(Contact *)item;
{
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", item.etatCivil.firstName, item.etatCivil.lastName];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
