#import <Foundation/Foundation.h>

#define HYD_INLINE FOUNDATION_STATIC_INLINE
#define HYD_EXTERN OBJC_EXPORT
#define HYD_REQUIRE_NON_NIL(...) __attribute__((nonnull (__VA_ARGS__)))
#define HYD_EXTERN_OVERLOADED HYD_EXTERN __attribute__((overloadable))
#define HYD_INLINE_OVERLOADED FOUNDATION_STATIC_INLINE __attribute__((overloadable))
