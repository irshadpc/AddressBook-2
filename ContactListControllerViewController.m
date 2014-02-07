//
//  ContactListControllerViewController.m
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
////

#import "ContactListControllerViewController.h"

@interface ContactListControllerViewController ()
// temporary method to initialize the cell's label with a sample string. later, it will need to show the contact's name and first name.
-(void)configureTextForCell:(UITableViewCell *)cell withItem:(Contact *)item;

// content filtering for the search bar
- (void) filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope;
@end

@implementation ContactListControllerViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    // for now this just overrides the method of UIviewcontroller and fills the array of this controller with references to the same contact
    // aDecoder is not yet used
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.contactList = [[NSMutableArray alloc] initWithCapacity:20];
        // Initialize the filtered array initially at the same size as the normal array.
        self.filteredContactList = [[NSMutableArray alloc] initWithCapacity:[self.contactList count]];
        
        
        Contact *myContact = [Contact new];
        myContact.etatCivil.firstName = @"Gilles";
        myContact.etatCivil.lastName = @"Major";
        for (int i = 0; i < 20; i++) {
            [self.contactList addObject:myContact];
        }
        
        // TO BE DELETED
        //[self.filteredContactList addObject:myContact];
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
    // Check to see whether the normal table or search results table is being displayed and return the count from the
    // appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredContactList count];
    }
    else {
        return [self.contactList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"contactCell";
    // in the example below, the self before table view is essential so the right type of cell is sent to the
    // search display table view
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    Contact *item;
    
    // Check to see whether the normal table or search results table is being displayed and set the item object from
    // the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        item = self.filteredContactList[indexPath.row];
    }
    else {
        item = self.contactList[indexPath.row];
    }
    

    [self configureTextForCell:cell withItem:item];
    
    return cell;
}

// to implement: indexed list allowing to scroll with alphabetical letters.

/*
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    
}

*/

// implementation of class extension methods
-(void)configureTextForCell:(UITableViewCell *)cell withItem:(Contact *)item;
{
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%@ %@", item.etatCivil.lastName, item.etatCivil.firstName];
}



#pragma mark - Content Filtering

- (void) filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredContactList removeAllObjects];
    // Filter the array using NSPredicate
    
    // the following is not yet correct. need to filter "gilles" "gilles major" "major" " major gilles etc"
    
    NSPredicate *predicateFirstName = [NSPredicate predicateWithFormat:@"SELF.etatCivil.firstName contains[c] %@", searchText];
    NSPredicate *predicateLastName = [NSPredicate predicateWithFormat:@"SELF.etatCivil.lastName contains[c] %@", searchText];
    NSArray *predicatesArray = [[NSArray alloc] initWithObjects:predicateFirstName, predicateLastName, nil];
    NSPredicate *orPred = [NSCompoundPredicate orPredicateWithSubpredicates:predicatesArray];
    
   
    self.filteredContactList = [NSMutableArray arrayWithArray:[self.contactList filteredArrayUsingPredicate:orPred]];
    //self.filteredContactList = [NSMutableArray arrayWithArray:[self.contactList filteredArrayUsingPredicate:predicate]];
}

// implementation of UISearchBarDelegate

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles]
        objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
   // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded
    return YES;
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
