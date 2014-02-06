//
//  EtatCivil.h
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Adresse.h"

@interface EtatCivil : NSObject
@property (nonatomic, retain)NSString *status, *firstName, *lastName;
@property (nonatomic, retain)Adresse *mainAddress;
@property (nonatomic, retain)NSDate *birthday;

- (id) init;
@end

