#import "DockEquippedUpgrade+Addons.h"

#import "DockCaptain+Addons.h"
#import "DockEquippedShip+Addons.h"
#import "DockEquippedUpgrade.h"
#import "DockShip+Addons.h"
#import "DockUpgrade+Addons.h"

@implementation DockEquippedUpgrade (Addons)

-(NSString*)title
{
    return self.upgrade.title;
}

-(NSString*)faction
{
    return self.upgrade.faction;
}

-(BOOL)isPlaceholder
{
    return self.upgrade.isPlaceholder;
}

-(NSString*)plainDescription
{
    return self.upgrade.plainDescription;
}

-(NSAttributedString*)styledDescription
{
    return self.upgrade.styledDescription;
}

-(NSArray*)sortedUpgrades
{
    return nil;
}

-(NSArray*)upgrades
{
    return nil;
}

-(int)baseCost
{
    DockUpgrade* upgrade = self.upgrade;

    if ([upgrade isPlaceholder]) {
        return 0;
    }

    return [upgrade.cost intValue];
}

-(int)cost
{
    DockShip* ship = self.equippedShip.ship;
    DockUpgrade* upgrade = self.upgrade;

    if ([upgrade isPlaceholder]) {
        return 0;
    }

    int cost = [upgrade.cost intValue];
    NSString* shipFaction = ship.faction;
    NSString* upgradeFaction = upgrade.faction;
    DockCaptain* captain = self.equippedShip.captain;
    NSString* captainSpecial = captain.special;
    NSString* upgradeSpecial = upgrade.special;

    if ([upgrade isTalent]) {
        if ([captainSpecial isEqualToString: @"BaselineTalentCostToThree"]) {
            cost = 3;
        }
    } else if ([upgrade isCaptain]) {
        int baseCost = [[upgrade cost] intValue];
        if (baseCost == 0) {
            return 0;
        }
    } else if ([upgrade isCrew]) {
        if ([captainSpecial isEqualToString: @"CrewUpgradesCostOneLess"]) {
            cost -= 1;
        }

        if ([upgradeSpecial isEqualToString: @"costincreasedifnotromulansciencevessel"]) {
            if (![ship.shipClass isEqualToString: @"Romulan Science Vessel"]) {
                cost += 5;
            }
        }
    } else if ([upgrade isWeapon]) {
        if ([captainSpecial isEqualToString: @"WeaponUpgradesCostOneLess"]) {
            cost -= 1;
        }
    }

    if ([upgradeSpecial isEqualToString: @"costincreasedifnotbreen"]) {
        if (![ship isBreen]) {
            cost += 5;
        }
    } else if ([upgradeSpecial isEqualToString: @"PenaltyOnShipOtherThanDefiant"]) {
        if (![ship isDefiant]) {
            cost += 5;
        }
    } else if ([upgradeSpecial isEqualToString: @"PlusFivePointsNonJemHadarShips"]) {
        if (![ship isJemhadar]) {
            cost += 5;
        }
    }

    if (![shipFaction isEqualToString: upgradeFaction]) {
        if ([captainSpecial isEqualToString: @"UpgradesIgnoreFactionPenalty"]) {
        } else if ([captainSpecial isEqualToString: @"NoPenaltyOnFederationOrBajoranShip"]) {
            if (!([ship isFederation] || [ship isBajoran])) {
                cost += 1;
            }
        } else if ([captainSpecial isEqualToString: @"CaptainAndTalentsIgnoreFactionPenalty"] &&
                   ([upgrade isTalent] || [upgrade isCaptain])) {
        } else {
            cost += 1;
        }

    }

    if ([captainSpecial isEqualToString: @"OneDominionUpgradeCostsMinusTwo"]) {
        if ([upgrade isDominion]) {
            DockEquippedUpgrade* most = [self.equippedShip mostExpensiveUpgradeOfFaction: @"Dominion"];

            if (most == self) {
                cost -= 2;
            }
        }
    }

    return cost;
}

-(int)rawCost
{
    return [self.upgrade.cost intValue];
}

-(NSComparisonResult)compareTo:(DockEquippedUpgrade*)other
{

    return [[self upgrade] compareTo: [other upgrade]];
}

-(NSString*)ability
{
    return self.upgrade.ability;
}

-(NSString*)typeCode
{
    return self.upgrade.typeCode;
}

@end
