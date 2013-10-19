//
//  DockSetItem.h
//  Space Dock
//
//  Created by Rob Tsuk on 10/11/13.
//  Copyright (c) 2013 Rob Tsuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DockSet;

@interface DockSetItem : NSManagedObject

@property (nonatomic, retain) NSSet *sets;
@end

@interface DockSetItem (CoreDataGeneratedAccessors)

- (void)addSetsObject:(DockSet *)value;
- (void)removeSetsObject:(DockSet *)value;
- (void)addSets:(NSSet *)values;
- (void)removeSets:(NSSet *)values;

@end