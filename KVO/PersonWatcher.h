//
//  PersonWatcher.h
//  KVC
//
//  Created by Christopher Motl on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonWatcher : NSObject {
    NSMutableArray *observedPeople;
}

-(void) watchPersonForChangeOfAddress:(Person*)p;

@end
