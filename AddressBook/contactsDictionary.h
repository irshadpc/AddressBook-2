//
//  contactsDictionary.h
//  AddressBook
//
//  Created by Gilles Major on 08/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

// NSString *const kDictionary = @"Contacts";

@interface ContactsDictionary : NSObject <NSCopying>
@property (nonatomic, retain) NSMutableDictionary  *contactsDictionary;
@property NSArray *letters;

- (id) init;
- (void) saveDictionaryToFile;
- (void) loadDictionaryFromFile;


@end
