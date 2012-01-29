//
//  Person.h
//  KVC
//
//  Created by Christopher Motl on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *name;
    NSString *address;
    Person *spouse;
}

@property (strong) NSString *name;
@property (strong) NSString *address;
@property (strong) Person *spouse;

@end
