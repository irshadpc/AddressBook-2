//
//  EtatCivil.m
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import "EtatCivil.h"

@implementation EtatCivil
- (id)init
{
    self = [super init];
    if (self) {
        _mainAddress = [Adresse new];
    }
    
    return self;
}
@end
