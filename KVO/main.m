//
//  main.m
//  KVO
//
//  Created by Christopher Motl on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "PersonWatcher.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        PersonWatcher *watcher = [PersonWatcher new];
        Person *person = [Person new];
        
        [watcher watchPersonForChangeOfAddress:person];
        
        person.name = @"Christopher";
        person.name = @"Christopher";        
        
    }
    return 0;
}

