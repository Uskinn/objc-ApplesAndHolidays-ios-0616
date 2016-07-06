//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
//
//    NSPredicate *containsApples = [NSPredicate predicateWithFormat:@"self == 'apples'"];
//    NSArray *applesArray = [fruits filteredArrayUsingPredicate:containsApples];
//    
//    
//    return applesArray;
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apples;
}

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    NSArray *allHolidatKeys = [database [season] allKeys];
    
    return allHolidatKeys;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    
  NSArray * newArray = [NSArray arrayWithArray:database [season][holiday]];
    
    return newArray;
}

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
     BOOL isContainsHoliday = [[database[season] allKeys] containsObject:holiday];
    
    return isContainsHoliday;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    BOOL isSupply = [database[season][holiday] containsObject:supply];
    
    return isSupply;
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
   database[season][holiday] = [[NSMutableArray alloc] init];
    
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}



@end