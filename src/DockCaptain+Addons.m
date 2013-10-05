//
//  DockCaptain+Addons.m
//  Space Dock
//
//  Created by Rob Tsuk on 9/28/13.
//  Copyright (c) 2013 Rob Tsuk. All rights reserved.
//

#import "DockCaptain+Addons.h"

#import "DockUpgrade+Addons.h"
#import "DockUtils.h"

@implementation DockCaptain (Addons)

-(int)talentCount
{
    return [self.talent intValue];
}

+(DockUpgrade*)zeroCostCaptain:(NSString*)faction context:(NSManagedObjectContext*)context
{
    NSEntityDescription* entity = [NSEntityDescription entityForName: @"Captain" inManagedObjectContext: context];
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    NSPredicate* predicateTemplate = [NSPredicate predicateWithFormat: @"cost = 0 and faction like %@", faction];
    [request setPredicate: predicateTemplate];
    NSError* err;
    NSArray* existingItems = [context executeFetchRequest: request error: &err];

    if (existingItems.count > 0) {
        return existingItems[0];
    }

    return nil;
}

+(DockUpgrade*)captainForId:(NSString*)externalId context:(NSManagedObjectContext*)context
{
    return [DockUpgrade upgradeForId: externalId context: context];
}


-(NSAttributedString*)styledDescription
{
    const double kRed = 0xd0/256.0;
    const double kGreen = 0x9C/256.0;
    const double kBlue = 0x23/256.0;
    NSColor* c = [NSColor colorWithDeviceRed: kRed green:kGreen blue:kBlue alpha:1];
    NSMutableAttributedString* as = [[NSMutableAttributedString alloc] initWithAttributedString: [super styledDescription]];
    [as appendAttributedString: [[NSMutableAttributedString alloc] initWithString: @" "]];
    [as appendAttributedString: coloredString([[self skill] stringValue], c, [NSColor clearColor])];
    return as;
}

@end
