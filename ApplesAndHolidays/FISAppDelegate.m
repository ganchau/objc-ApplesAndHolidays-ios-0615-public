//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

+ (NSMutableArray *)applePickerWithFruits:(NSMutableArray *)fruits;
{
    /* 
    // filter by iterating through loop
    NSMutableArray *appleArray = [@[] mutableCopy];
    for (NSString *fruit in fruits) {
        if ([fruit isEqual:@"apple"]) {
            [appleArray addObject:fruit];
        }
    }
    */
    // filter using a predicate
    NSString *apple = @"apple";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", apple];
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:predicate];
    return [appleArray mutableCopy];
}

+ (NSMutableDictionary *)addSupply:(NSString *)supply
                   toWinterHoliday:(NSString *)holiday
{
    NSMutableDictionary *holidaySupplies = [self holidaySupplies];
    NSArray *holidayKeys = [holidaySupplies[@"winter"] allKeys];   // store keys for winter holidays
    
    for (NSString *holidayKey in holidayKeys) {   // iterate through winter holidays
        if ([holidayKey isEqualToString:holiday]) {
            [holidaySupplies[@"winter"][holiday] addObject:supply];    // add supply if holiday exists
            break;
        }
    }
    return holidaySupplies;
}

+ (NSString *)secondSupplyFourthOfJuly
{
    return [self holidaySupplies][@"summer"][@"fourthOfJuly"][1];
}

+ (NSMutableDictionary *)holidaySupplies
{
    
    NSMutableDictionary *winter = [@{@"christmas" : [NSMutableArray arrayWithArray:@[@"Lights", @"Wreath"]],
                                     @"newYears" : [NSMutableArray arrayWithArray:@[@"Party Hats"]]} mutableCopy];
    
    NSMutableDictionary *summer = [@{@"fourthOfJuly" : [NSMutableArray arrayWithArray:@[@"Fireworks", @"BBQ"]]} mutableCopy];
   
    NSMutableDictionary *fall = [@{@"thanksgiving" : [NSMutableArray arrayWithArray:@[@"Turkey"]]} mutableCopy];
    
    NSMutableDictionary *spring = [@{@"memorialDay" : [NSMutableArray arrayWithArray:@[@"BBQ"]]} mutableCopy];
    
    return [NSMutableDictionary dictionaryWithDictionary:
            @{@"winter" : winter,
              @"summer" : summer,
              @"fall" : fall,
              @"spring" : spring}];
}

+ (NSMutableDictionary *)addSupplyToMemorialDay:(NSString *)supply
{
    NSMutableDictionary *holidaySupplies = [self holidaySupplies];
    [holidaySupplies[@"spring"][@"memorialDay"] addObject:supply];
    return holidaySupplies;
}

+ (NSMutableDictionary *)addHoliday:(NSString *)holiday
                           toSeason:(NSString *)season
                       withSupplies:(NSArray *)newHolidaySupplies
{
    NSMutableDictionary *holidaySupplies = [self holidaySupplies];
    NSArray *seasonKeys = [holidaySupplies allKeys];
    
    for (NSString *seasonKey in seasonKeys) {
        if ([seasonKey isEqualToString:season]) {
            holidaySupplies[season][holiday] = newHolidaySupplies;
            break;
        }
    }
    return holidaySupplies;
}



@end