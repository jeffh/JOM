#import "HYDBase.h"

@protocol HYDMapper;

/*! Constructs a mapper that converts strings to dates.
 *
 *  @params formatString The date format string to parse the string.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapStringToDate(NSString *formatString);

/*! Constructs a mapper that converts strings to dates.
 *
 *  @params mapper The mapper that processes the source value before this mapper.
 *  @params formatString The date format string to parse the string.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapStringToDate(id<HYDMapper> mapper, NSString *formatString);

/*! Constructs a mapper that converts strings to dates.
 *
 *  @params dateFormatter The date formatter instance to use to parse date strings.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapStringToDate(NSDateFormatter *dateFormatter)
HYD_REQUIRE_NON_NIL(1);

/*! Constructs a mapper that converts strings to dates.
 *
 *  @params mapper The mapper that processes the source value before this mapper.
 *  @params dateFormatter The date formatter instance to use to parse date strings.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapStringToDate(id<HYDMapper> mapper, NSDateFormatter *dateFormatter)
HYD_REQUIRE_NON_NIL(2);

/*! Constructs a mapper that converts strings to dates. Unlike other helper functions,
 *  this one will attempt any method that works.
 *
 *  @warning Reversing this mapper may produce unexpected results.
 *
 *  @params innerMapper The mapper that processes the source value before this mapper.
 *  @params dateFormatter The date formatter instance to use to parse date strings.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapStringToAnyDate(void);

/*! Constructs a mapper that converts strings to dates. Unlike other helper functions,
 *  this one will attempt any method that works.
 *
 *  @warning Reversing this mapper may produce unexpected results.
 *
 *  @params innerMapper The mapper that processes the source value before this mapper.
 *  @params dateFormatter The date formatter instance to use to parse date strings.
 */
HYD_EXTERN_OVERLOADED
id<HYDMapper> HYDMapStringToAnyDate(id<HYDMapper> innerMapper)
HYD_REQUIRE_NON_NIL(1);
