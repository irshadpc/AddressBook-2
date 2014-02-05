//
//  ContactListControllerViewController.h
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactListControllerViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *contactList;

// override
-(id)initWithCoder:(NSCoder *)aDecoder;

@end
