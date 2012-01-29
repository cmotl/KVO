//
//  Person.m
//  KVC
//
//  Created by Christopher Motl on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;
@synthesize address;
@synthesize spouse;

-(id) init {
    if(self = [super init]) {
        name = @"";
        address = @"";
        spouse = nil;
    }
    
    return self;
}

/*
 - (void)encodeWithCoder: (NSCoder *)coder
 {
 [coder encodeObject: self.name forKey: @"name"];
 [coder encodeObject: self.address forKey: @"address"];
 [coder encodeObject: self.spouse forKey: @"spouse"];
 }
 
 - (id)initWithCoder: (NSCoder *)coder
 {
 if((self = [self init]))
 {
 self.name = [coder decodeObjectForKey: @"name"];
 self.address = [coder decodeObjectForKey: @"address"];
 self.spouse = [coder decodeObjectForKey: @"spouse"];
 }
 return self;
 }
 */
@end
