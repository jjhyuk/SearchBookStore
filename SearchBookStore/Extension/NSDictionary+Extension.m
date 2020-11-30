//
//  NSDictionary+Extension.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary(Extension)

static NSString *toString(id object) {
  return [NSString stringWithFormat: @"%@", object];
}

static NSString *urlEncode(id object) {
  NSString *string = toString(object);
  return [string stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
}

-(NSString*) urlEncodedString {
  NSMutableArray *parts = [NSMutableArray array];
  for (id key in self) {
    id value = [self objectForKey: key];
    NSString *part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
    [parts addObject: part];
  }
  return [parts componentsJoinedByString: @"&"];
}

-(NSDictionary *)dictionaryByMergingDictionary:(NSDictionary*)mergeDict{
  NSMutableDictionary *dict = [self mutableCopy];
  
  // 어레이 골라내기
  NSMutableArray *array = [[dict objectForKey:@"books"] mutableCopy];
  [array addObjectsFromArray:[mergeDict objectForKey:@"books"]];
  
  [dict addEntriesFromDictionary:mergeDict];
  [dict setObject:array forKey:@"books"];
  return [dict copy];
}
@end
