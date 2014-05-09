#import "HYDBase.h"
#import "HYDMapper.h"
#import "HYDConstants.h"


@interface HYDNumberToDateMapper : NSObject <HYDMapper>

- (id)init;
- (id)initWithNumericUnit:(HYDDateTimeUnit)unit sinceDate:(NSDate *)sinceDate;

@end


/*! Returns a mapper that converts numbers to NSDates.
 *  The number should be seconds relative to 1970.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapNumberToDateSince1970(void);

/*! Returns a mapper that converts numbers to NSDates.
 *  The number should be a value relative to 1970.
 *
 *  @param unit The time unit the source number is in.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapNumberToDateSince1970(HYDDateTimeUnit unit);


/*! Returns a mapper that converts numbers to NSDates.
 *  The number should be seconds relative to a given date.
 *
 *  @param sinceDate The date the numeric value is relative to.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapNumberToDateSince(NSDate *sinceDate)
HYD_REQUIRE_NON_NIL(1);

/*! Returns a mapper that converts numbers to NSDates.
 *  The number should be a value relative to a given date.
 *
 *  @param unit The time unit the source number is in.
 *  @param sinceDate The date the numeric value is relative to.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapNumberToDateSince(HYDDateTimeUnit unit, NSDate *sinceDate)
HYD_REQUIRE_NON_NIL(2);