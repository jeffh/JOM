#import "HYDBackwardMapper.h"
#import "HYDFactory.h"
#import "HYDObjectFactory.h"
#import "HYDFunctions.h"
#import "HYDError.h"
#import "HYDAccessor.h"
#import "HYDForwardMapper.h"
#import "HYDDefaultAccessor.h"


@interface HYDBackwardMapper ()

@property (strong, nonatomic) id<HYDMapper> childMapper;
@property (strong, nonatomic) id<HYDAccessor> walkAccessor;
@property (strong, nonatomic) Class sourceClass;
@property (strong, nonatomic) Class destinationClass;
@property (strong, nonatomic) id<HYDFactory> factory;

@end

@implementation HYDBackwardMapper

- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (id)initWithMapper:(id<HYDMapper>)mapper
        walkAccessor:(id<HYDAccessor>)walkAccessor
         sourceClass:(Class)sourceClass
    destinationClass:(Class)destinationClass
{
    self = [super init];
    if (self) {
        self.childMapper = mapper;
        self.walkAccessor = walkAccessor;
        self.sourceClass = sourceClass;
        self.destinationClass = destinationClass;
        self.factory = [[HYDObjectFactory alloc] init];
    }
    return self;
}

#pragma mark - <HYDMapper>

- (id)objectFromSourceObject:(id)sourceObject error:(__autoreleasing HYDError **)error
{
    HYDError *err = nil;
    id resultingObjectPartial = [self.childMapper objectFromSourceObject:sourceObject error:&err];

    if (err) {
        HYDSetObjectPointer(error, [HYDError errorFromError:err
                                   prependingSourceAccessor:nil
                                     andDestinationAccessor:self.walkAccessor
                                    replacementSourceObject:sourceObject
                                                    isFatal:[err isFatal]]);
    }

    if ([err isFatal]) {
        return nil;
    }

    id resultingObject = [self.factory newObjectOfClass:self.destinationClass];

    err = [self.walkAccessor setValues:HYDValuesFromValueOrValues(resultingObjectPartial) onObject:resultingObject];

    if ([err isFatal]) {
        HYDSetObjectPointer(error, err);
        return nil;
    }

    return resultingObject;
}

- (id<HYDAccessor>)destinationAccessor
{
    return [self.childMapper destinationAccessor];
}

- (id<HYDMapper>)reverseMapperWithDestinationAccessor:(id<HYDAccessor>)destinationAccessor
{
    id<HYDMapper> reversedMapper = [self.childMapper reverseMapperWithDestinationAccessor:destinationAccessor];
    return [[HYDForwardMapper alloc] initWithMapper:reversedMapper
                                       walkAccessor:self.walkAccessor
                                        sourceClass:self.destinationClass
                                   destinationClass:self.sourceClass];
}

@end

HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapBackward(id<HYDAccessor> walkAccessor, Class sourceClass, Class destinationClass, id<HYDMapper> childMapper)
{
    return [[HYDBackwardMapper alloc] initWithMapper:childMapper walkAccessor:walkAccessor sourceClass:sourceClass destinationClass:destinationClass];
}

HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapBackward(NSString *destinationKey, Class sourceClass, Class destinationClass, id<HYDMapper> childMapper)
{
    return HYDMapBackward(HYDAccessDefault(destinationKey), sourceClass, destinationClass, childMapper);
}

HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapBackward(id<HYDAccessor> accessor, Class destinationClass, id<HYDMapper> childMapper)
{
    return HYDMapBackward(accessor, [NSDictionary class], [NSDictionary class], childMapper);
}

HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapBackward(NSString *destinationKey, Class destinationClass, id<HYDMapper> childMapper)
{
    return HYDMapBackward(HYDAccessDefault(destinationKey), [NSDictionary class], childMapper);
}

HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapBackward(id<HYDAccessor> accessor, id<HYDMapper> childMapper)
{
    return HYDMapBackward(accessor, [NSDictionary class], [NSDictionary class], childMapper);
}

HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapBackward(NSString *destinationKey, id<HYDMapper> childMapper)
{
    return HYDMapBackward(HYDAccessDefault(destinationKey), childMapper);
}
