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
@property (nonatomic, copy)NSString *status, *firstName, *lastName;
@property (nonatomic, copy)Adresse *mainAddress;
@property (nonatomic, copy)NSDate *birthday;
@end

