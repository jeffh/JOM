// DO NOT any other library headers here to simulate an API user.
#import "Hydrant.h"
#import "HYDPerson.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(HYDMapperCompositionSpec)

describe(@"Mapper Composition", ^{
    __block id<HYDMapper> mapper;
    __block HYDPerson *expectedObjectGraph;
    __block NSDictionary *expectedObjectStructure;
    __block HYDError *error;
    __block id parsedObject;

    beforeEach(^{
        HYDDotNetDateFormatter *dotNetDateFormatter = [[HYDDotNetDateFormatter alloc] init];

        mapper = HYDMapObject(HYDRootMapper, [NSDictionary class], [HYDPerson class],
                              @{@"person" : HYDMapObjectPath(@"parent", [NSDictionary class], [HYDPerson class],
                                                             @{@"id" : @"identifier",
                                                               @"name.first" : @"firstName",
                                                               @"name.last" : @"lastName",
                                                               @"age" : HYDStringToNumber(@"age"),
                                                               @"birth_date" : HYDStringToDate(@"birthDate", dotNetDateFormatter)}),
                                @"identifier" : HYDOptional(HYDIdentity(@"identifier")),
                                @"gender" : HYDEnum(@"gender", @{@"unknown" : @(HYDPersonGenderUnknown),
                                                                 @"male" : @(HYDPersonGenderMale),
                                                                 @"female" : @(HYDPersonGenderFemale)})});
        expectedObjectStructure = @{@"person": @{@"id": @1,
                                                 @"name": @{@"first": @"John",
                                                            @"last": @"Doe"},
                                                 @"age": @"22",
                                                 @"birth_date": @"/Date(1390186634595)/"},
                                    @"identifier": @42,
                                    @"gender": @"male"};
        expectedObjectGraph = [[HYDPerson alloc] init];
        expectedObjectGraph.identifier = 42;
        expectedObjectGraph.gender = HYDPersonGenderMale;
        expectedObjectGraph.parent = ({
            HYDPerson *parent = [[HYDPerson alloc] init];
            parent.identifier = 1;
            parent.firstName = @"John";
            parent.lastName = @"Doe";
            parent.age = 22;
            parent.birthDate = [NSDate dateWithTimeIntervalSince1970:1390186634.595];
            parent;
        });
    });

    describe(@"mapping from dictionaries to an object graph", ^{
        beforeEach(^{
            parsedObject = [mapper objectFromSourceObject:expectedObjectStructure error:&error];
        });

        it(@"should not error", ^{
            error should be_nil;
        });

        it(@"should build the object graph correctly", ^{
            parsedObject should equal(expectedObjectGraph);
        });
    });

    describe(@"mapping from object graph to dictionaries using the reverse mapper", ^{
        beforeEach(^{
            id<HYDMapper> reverseMapper = [mapper reverseMapperWithDestinationKey:nil];
            parsedObject = [reverseMapper objectFromSourceObject:expectedObjectGraph error:&error];
        });

        it(@"should not error", ^{
            error should be_nil;
        });

        it(@"should build the json correctly", ^{
            parsedObject should equal(expectedObjectStructure);
        });
    });
});

SPEC_END