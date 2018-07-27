#import "NSDictionaryExtension.h"
#import <math.h>

@implementation NSDictionary(JustepAppNSDictionaryExtension)

- (bool) existsValue:(NSString*)expectedValue forKey:(NSString*)key
{
	id val = [self valueForKey:key];
	bool exists = false;
	if (val != nil) {
		exists = [(NSString*)val compare:expectedValue options:NSCaseInsensitiveSearch] == 0;
	}
	
	return exists;
}

- (NSInteger) integerValueForKey:(NSString*)key  defaultValue:(NSInteger)defaultValue withRange:(NSRange)range
{

	NSInteger value = defaultValue;
	
	NSNumber* val = [self valueForKey:key];  //value is an NSNumber
	if (val != nil) {
		value = [val integerValue];
	}
	
	// min, max checks
	value = MAX(range.location, value);
	value = MIN(range.length, value);
	
	return value;
}


- (BOOL) typeValueForKey:(NSString *)key isArray:(BOOL*)bArray isNull:(BOOL*)bNull isNumber:(BOOL*) bNumber isString:(BOOL*)bString   
{
	BOOL bExists = YES;
	NSObject* value = [self objectForKey: key];
	if (value) {
		bExists = YES;
		if (bString)
			*bString = [value isKindOfClass: [NSString class]];
		if (bNull)
			*bNull = [value isKindOfClass: [NSNull class]];
		if (bArray)
			*bArray = [value isKindOfClass: [NSArray class]];
		if (bNumber)
			*bNumber = [value isKindOfClass:[NSNumber class]];
	}
	return bExists;
}
- (BOOL) valueForKeyIsArray:(NSString *)key
{
	BOOL bArray = NO;
	NSObject* value = [self objectForKey: key];
	if (value) {
		bArray = [value isKindOfClass: [NSArray class]];
	}
	return bArray;
}
- (BOOL) valueForKeyIsNull:(NSString *)key
{
	BOOL bNull = NO;
	NSObject* value = [self objectForKey: key];
	if (value) {
		bNull = [value isKindOfClass: [NSNull class]];
	}
	return bNull;
}
- (BOOL) valueForKeyIsString:(NSString *)key
{
	BOOL bString = NO;
	NSObject* value = [self objectForKey: key];
	if (value) {
		bString = [value isKindOfClass: [NSString class]];
	}
	return bString;
}
- (BOOL) valueForKeyIsNumber:(NSString *)key
{
	BOOL bNumber = NO;
	NSObject* value = [self objectForKey: key];
	if (value) {
		bNumber = [value isKindOfClass: [NSNumber class]];
	}
	return bNumber;
}
	
@end

