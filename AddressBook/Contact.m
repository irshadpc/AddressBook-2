//
//  Contact.m
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (id)init
{
    self = [super init];
    if (self) {
        _etatCivil = [EtatCivil new];
        _communications = [Communications new];
        _otherInfo = [OtherInfo new];
    }
    return self;
}
@end
