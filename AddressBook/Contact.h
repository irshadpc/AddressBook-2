//
//  Contact.h
//  AddressBook
//
//  Created by Gilles Major on 05/02/14.
//  Copyright (c) 2014 Gilles Major. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EtatCivil.h"
#import "OtherInfo.h"
#import "Communications.h"

@interface Contact : NSObject
@property (nonatomic, copy)EtatCivil *civil;
@property (nonatomic, copy)Communications *communication;
@property (nonatomic, copy)OtherInfo *other;
@end
