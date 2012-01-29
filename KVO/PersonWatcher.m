#import "PersonWatcher.h"

static NSString* const KVO_CONTEXT_ADDRESS_CHANGED = @"KVO_CONTEXT_ADDRESS_CHANGED";
static NSString* const KVO_CONTEXT_NAME_CHANGED = @"KVO_CONTEXT_NAME_CHANGED";

@implementation PersonWatcher 

-(void) watchPersonForChangeOfAddress:(Person*)p
{
    //this begins the observing
    [p addObserver:self 
        forKeyPath:@"address" 
           options:(NSKeyValueObservingOptionNew |
                            NSKeyValueObservingOptionOld)
           context:(__bridge_retained void *)KVO_CONTEXT_ADDRESS_CHANGED];

    [p addObserver:self 
        forKeyPath:@"name" 
           options:(NSKeyValueObservingOptionNew |
                    NSKeyValueObservingOptionOld) 
           context:(__bridge_retained void *)KVO_CONTEXT_NAME_CHANGED];
  
    //keep a record of all the people being observed,
    //because we need to stop observing them in dealloc
    [observedPeople addObject:p];
}

//whenever an observed key path changes, this method will be called
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
     //use the context to make sure this is a change in the address,
    //because we may also be observing other things 
    if(context == (__bridge_retained void *)KVO_CONTEXT_ADDRESS_CHANGED){
        NSString* name = [object valueForKey:@"name"];
        NSString* address = [object valueForKey:@"address"];
        NSLog(@"%@ has a new address: %@", name, address);
    }
	else if(context == (__bridge_retained void *)KVO_CONTEXT_NAME_CHANGED){
        NSString* name = [object valueForKey:@"name"];
        //NSString* address = [object valueForKey:@"address"];
        NSLog(@"%@ has a new name: %@", name, change);
    }	
}

-(void) dealloc;
{
    //must stop observing everything before this object is
    //deallocated, otherwise it will cause crashes
    for(Person* p in observedPeople){
        [p removeObserver:self forKeyPath:@"address"];
        [p removeObserver:self forKeyPath:@"name"];        
    }
    
}

-(id) init;
{
    if(self = [super init]){
        observedPeople = [NSMutableArray new];
    }
    return self;
}

@end