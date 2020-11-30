//
//  SearchBook.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/26.
//

#import "SearchBook.h"

@interface SearchBook()
{
  NSString *_jsonData;
}

@end

@implementation SearchBook

-(instancetype)initWith:(NSDictionary *)data{
  
  if(self = [super init]){
    _title = [data objectForKey:@"title"];
    _subtitle = [data objectForKey:@"subtitle"];
    _isbn13 = [data objectForKey:@"isbn13"];
    _price = [data objectForKey:@"price"];
    _image = [data objectForKey:@"image"];
    _url = [data objectForKey:@"url"];
    
    _jsonData = [data description];
  }
  
  return self;
}

-(NSString *)description{
  return [self->_jsonData description];
}

@end
