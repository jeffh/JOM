#import "HYDToStringMapper.h"
#import "HYDValueTransformerMapper.h"
#import "HYDStringValueTransformer.h"
#import "HYDIdentityMapper.h"


HYD_EXTERN
id<HYDMapper> HYDMapToString()
{
    return HYDMapToStringFrom(HYDMapIdentity());
}


HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapToStringFrom(id<HYDMapper> innerMapper)
{
    return HYDMapValue(innerMapper, [[HYDStringValueTransformer alloc] init]);
}
