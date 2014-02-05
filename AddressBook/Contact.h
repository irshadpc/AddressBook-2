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
@property (nonatomic, copy)EtatCivil *etatCivil;
@property (nonatomic, copy)Communications *communications;
@property (nonatomic, copy)OtherInfo *otherInfo;
@end
