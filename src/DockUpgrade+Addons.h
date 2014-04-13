#import "DockUpgrade.h"

@class DockEquippedShip;

@interface DockUpgrade (Addons)
+(NSSet*)allFactions:(NSManagedObjectContext*)context;
+(DockUpgrade*)placeholder:(NSString*)upType inContext:(NSManagedObjectContext*)context;
+(DockUpgrade*)upgradeForId:(NSString*)externalId context:(NSManagedObjectContext*)context;
+(NSArray*)findUpgrades:(NSString*)title context:(NSManagedObjectContext*)context;
-(BOOL)isTalent;
-(BOOL)isCrew;
-(BOOL)isWeapon;
-(BOOL)isBorg;
-(BOOL)isCaptain;
-(BOOL)isPlaceholder;
-(BOOL)isUnique;
-(BOOL)isDominion;
-(BOOL)isKlingon;
-(BOOL)isBajoran;
-(BOOL)isFederation;
-(NSComparisonResult)compareTo:(DockUpgrade*)other;
-(int)limitForShip:(DockEquippedShip*)targetShip;
-(int)additionalWeaponSlots;
-(NSString*)targetShipClass;
-(NSString*)upSortType;
-(NSString*)typeCode;
-(NSString*)plainDescription;
-(int)costForShip:(DockEquippedShip*)equippedShip;
@end
