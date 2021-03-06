#import "DockAdmiral+MacAddons.h"

#import "DockCaptain+MacAddons.h"
#import "DockUtilsMac.h"

@implementation DockAdmiral (MacAddons)

+(NSSet*)keyPathsForValuesAffectingStyledSkillModifier
{
    return [NSSet setWithObjects: @"skillModifier", nil];
}

-(NSAttributedString*)styledSkillModifier
{
    NSColor* c = [DockCaptain captainSkillColor];
    NSString* s = [NSString stringWithFormat: @"+%@", [self skillModifier]];
    return makeCentered(coloredString(s, c, [NSColor clearColor]));
}

@end
