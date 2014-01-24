#import "HYDBase.h"
#import "HYDMapper.h"


@interface HYDTypedMapper : NSObject <HYDMapper>

- (id)initWithMapper:(id<HYDMapper>)mapper inputClasses:(NSArray *)inputClasses outputClasses:(NSArray *)outputClasses;

@end


HYD_EXTERN
HYDTypedMapper *HYDMapType(id<HYDMapper> mapperToWrap, Class expectedInputClass, Class expectedOutputClass)
HYD_REQUIRE_NON_NIL(1,2,3);

HYD_EXTERN
HYDTypedMapper *HYDMapTypes(id<HYDMapper> mapperToWrap, NSArray *expectedInputClasses, NSArray *expectedOutputClasses)
HYD_REQUIRE_NON_NIL(1,2,3);
