#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISAppDelegate.h"


SpecBegin(HolidaysTests)

describe(@"HolidaysSpec", ^{
    describe(@"holidaySupplies", ^{
        it(@"should have a holidaySupplies class method", ^{
            expect([FISAppDelegate class]).respondTo(@selector(holidaySupplies));
        });
        it(@"should return a mutable dictionary from the holidaySupplies class method", ^{
            
            NSMutableDictionary *holidaySupplies = [FISAppDelegate holidaySupplies];
            expect(holidaySupplies).to.beKindOf([NSMutableDictionary class]);
            
            //Winter
            expect(holidaySupplies[@"winter"]).to.beKindOf([NSMutableDictionary class]);
            
            //Winter -> Christmas
            expect(holidaySupplies[@"winter"][@"christmas"]).to.beKindOf([NSMutableArray class]);
            expect([holidaySupplies[@"winter"][@"christmas"] count]).to.equal(2);
            expect(holidaySupplies[@"winter"][@"christmas"][0]).to.equal(@"Lights");
            expect(holidaySupplies[@"winter"][@"christmas"][1]).to.equal(@"Wreath");
            
            //Winter -> New Years
            expect(holidaySupplies[@"winter"][@"newYears"]).to.beKindOf([NSMutableArray class]);
            expect([holidaySupplies[@"winter"][@"newYears"] count]).to.equal(1);
            expect(holidaySupplies[@"winter"][@"newYears"][0]).to.equal(@"Party Hats");
            
            //Summer
            expect(holidaySupplies[@"summer"]).to.beKindOf([NSMutableDictionary class]);
            
            //Summer -> Fourth of July
            expect(holidaySupplies[@"summer"][@"fourthOfJuly"]).to.beKindOf([NSMutableArray class]);
            expect([holidaySupplies[@"summer"][@"fourthOfJuly"] count]).to.equal(2);
            expect(holidaySupplies[@"summer"][@"fourthOfJuly"][0]).to.equal(@"Fireworks");
            expect(holidaySupplies[@"summer"][@"fourthOfJuly"][1]).to.equal(@"BBQ");
            
            //Fall
            expect(holidaySupplies[@"fall"]).to.beKindOf([NSMutableDictionary class]);
            
            //Fall -> Thanksgiving
            expect(holidaySupplies[@"fall"][@"thanksgiving"]).to.beKindOf([NSMutableArray class]);
            expect([holidaySupplies[@"fall"][@"thanksgiving"] count]).to.equal(1);
            expect(holidaySupplies[@"fall"][@"thanksgiving"][0]).to.equal(@"Turkey");
            
            //Spring
            expect(holidaySupplies[@"spring"]).to.beKindOf([NSMutableDictionary class]);
            
            //Spring -> Memorial Day
            expect(holidaySupplies[@"spring"][@"memorialDay"]).to.beKindOf([NSMutableArray class]);
            expect([holidaySupplies[@"spring"][@"memorialDay"] count]).to.equal(1);
            expect(holidaySupplies[@"spring"][@"memorialDay"][0]).to.equal(@"BBQ");
            
        });
    });
    
    describe(@"secondSupplyFourthOfJuly", ^{
        it(@"should have a class method that returns the second supply on the fourth of July as a string", ^{
            
            expect([FISAppDelegate class]).to.respondTo(@selector(secondSupplyFourthOfJuly));
            
            NSString *secondSupply = [FISAppDelegate secondSupplyFourthOfJuly];
            
            expect(secondSupply).to.beKindOf([NSString class]);
            expect(secondSupply).to.equal(@"BBQ");
        });
    });
    
    describe(@"addSupplyToMemorialDay", ^{
        it(@"should have a class method that returns a copy of the holiday supplies mutable dictionary with an additional supply added to memorial day", ^{
            
            expect([FISAppDelegate class]).to.respondTo(@selector(addSupplyToMemorialDay:));
            
            NSMutableDictionary *modifiedHolidaySupplies = [FISAppDelegate addSupplyToMemorialDay:@"Pool"];
            
            expect(modifiedHolidaySupplies).to.beKindOf([NSMutableDictionary class]);
            expect([modifiedHolidaySupplies[@"spring"][@"memorialDay"] count]).to.equal(2);
            expect(modifiedHolidaySupplies[@"spring"][@"memorialDay"][1]).to.equal(@"Pool");
        });
    });
    
    describe(@"addSupplyToWinterHoliday", ^{
        it (@"should have a class method that adds a supply to a given winter holiday. If the holiday passed in doesn't exist the meethod should return the original Dictionary", ^{
            
            expect([FISAppDelegate class]).to.respondTo(@selector(addSupply:toWinterHoliday:));
            
            NSMutableDictionary *modifiedHolidaySupplies = [FISAppDelegate addSupply:@"Tree" toWinterHoliday:@"christmas"];
            NSMutableDictionary *invalidHolidaySupplies = [FISAppDelegate addSupply:@"Chair" toWinterHoliday:@"fourthOfJuly"];
            
            expect(modifiedHolidaySupplies).to.beKindOf([NSMutableDictionary class]);
            expect(modifiedHolidaySupplies[@"winter"][@"christmas"][2]).to.equal(@"Tree");
            
            expect(invalidHolidaySupplies).to.equal([FISAppDelegate holidaySupplies]);
    
        });
    });
    
    describe(@"addHolidayToSeasonWithSupplies", ^{
        it (@"should have a class method that adds a holiday to any season; and also add a supply to that holiday", ^{
            expect([FISAppDelegate class]).to.respondTo(@selector(addHoliday:toSeason:withSupplies:));
        
            NSMutableDictionary *newHolidaySupplies = [FISAppDelegate addHoliday:@"Channukah" toSeason:@"winter" withSupplies:@[@"Dreidel"]];
            expect(newHolidaySupplies[@"winter"][@"Channukah"][0]).to.equal(@"Dreidel");
        });
    });
    
});


SpecEnd

