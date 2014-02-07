//
//  ContactListControllerViewController.h
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactListControllerViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *contactList;
@property (nonatomic, strong) NSMutableArray *filteredContactList;

// override
-(id)initWithCoder:(NSCoder *)aDecoder;

@end
