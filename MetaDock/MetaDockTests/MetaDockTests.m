#import <XCTest/XCTest.h>

#import "DockGameSystem.h"
#import "DockUniverse.h"

@interface MetaDockTests : XCTestCase
@property (strong, nonatomic) DockUniverse* universe;
@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@end

@implementation MetaDockTests

// Creates if necessary and returns the managed object model for the application.
-(NSManagedObjectModel*)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL* modelURL = [[NSBundle mainBundle] URLForResource: @"MetaDock" withExtension: @"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL: modelURL];
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator*)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSManagedObjectModel* mom = [self managedObjectModel];
    
    if (!mom) {
        NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSPersistentStoreCoordinator* coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: mom];
    
    NSDictionary* options = @{
                              NSMigratePersistentStoresAutomaticallyOption : @YES,
                              NSInferMappingModelAutomaticallyOption: @YES
                              };
    NSError* error;
    if (![coordinator addPersistentStoreWithType: NSInMemoryStoreType
                                   configuration: nil
                                             URL: nil
                                         options: options
                                           error: &error]) {
        return nil;
    }
    
    _persistentStoreCoordinator = coordinator;
    
    return _persistentStoreCoordinator;
}

-(NSManagedObjectContext*)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator* coordinator = [self persistentStoreCoordinator];

    if (!coordinator) {
        return nil;
    }

    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator: coordinator];

    return _managedObjectContext;
}

- (void)setUp
{
    [super setUp];
    NSProcessInfo* info = [NSProcessInfo processInfo];
    NSString* baseDir = info.environment[@"PWD"];
    NSString* gameSystemDir = [baseDir stringByAppendingPathComponent: @"GameSystems"];
    _universe = [[DockUniverse alloc] initWithContext: self.managedObjectContext templatesPath: gameSystemDir];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCoreData
{
    NSManagedObjectContext* context = self.managedObjectContext;
    XCTAssertNotNil(context);
    NSManagedObjectModel* model = context.persistentStoreCoordinator.managedObjectModel;
    XCTAssertNotNil(model);
    NSArray* entities = model.entities;
    XCTAssertNotNil(entities);
    XCTAssertTrue(entities.count > 0, @"Expected to find entities but didn't");
}

- (void)testLoadingGameSystems
{
    NSSet* gameSystems = [_universe gameSystems];
    
    XCTAssertEqual(gameSystems.count, 3);
    
    NSArray* expectedTitles = @[
                                @"Star Trek: Attack Wing",
                                @"D&D Attack Wing",
                                @"X-Wing"
                                ];
    
    for (NSString* expectedTitle in expectedTitles) {
        id objectWithTitle = ^(id obj, BOOL* stop) {
            NSString* title = [obj title];
            return [title isEqualToString: expectedTitle];
        };
        NSSet* matching = [gameSystems objectsPassingTest: objectWithTitle];
        XCTAssertEqual(matching.count, 1, @"Expected to find a game system titled '%@' but didn't.", expectedTitle);
    }
}

-(void)testGameSystemTerms
{
    DockGameSystem* staw = [_universe gameSystemWithIdentifier: @"staw"];
    XCTAssertNotNil(staw);
    XCTAssertEqualObjects([staw term: @"list" count: 0], @"Squads");
    XCTAssertEqualObjects([staw term: @"list" count: 1], @"Squad");
    XCTAssertEqualObjects([staw term: @"list" count: 3], @"Squads");
    
    DockGameSystem* ddaw = [_universe gameSystemWithIdentifier: @"ddaw"];
    XCTAssertNotNil(ddaw);
    XCTAssertEqualObjects([ddaw term: @"list" count: 0], @"Legions");
    XCTAssertEqualObjects([ddaw term: @"list" count: 1], @"Legion");
    XCTAssertEqualObjects([ddaw term: @"list" count: 3], @"Legions");
    
    DockGameSystem* xwing = [_universe gameSystemWithIdentifier: @"xwing"];
    XCTAssertNotNil(xwing);
    XCTAssertEqualObjects([xwing term: @"list" count: 0], @"Squads");
    XCTAssertEqualObjects([xwing term: @"list" count: 1], @"Squad");
    XCTAssertEqualObjects([xwing term: @"list" count: 3], @"Squads");
    
}

@end
