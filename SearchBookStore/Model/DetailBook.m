//
//  DetailBook.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/27.
//

#import "DetailBook.h"

@interface DetailBook()
{
  NSString *_jsonData;
}
@end

@implementation DetailBook

-(instancetype)initWith:(NSDictionary *)data{
  
  if(self = [super init]){
    _title = [data objectForKey:@"title"];
    _subtitle = [data objectForKey:@"subtitle"];
    _authors = [data objectForKey:@"authors"];
    _publisher = [data objectForKey:@"publisher"];
    _language = [data objectForKey:@"language"];
    _isbn10 = [data objectForKey:@"isbn10"];
    _isbn13 = [data objectForKey:@"isbn13"];
    _pages = [data objectForKey:@"pages"];
    _year = [data objectForKey:@"year"];
    _rating = [data objectForKey:@"rating"];
    _desc = [data objectForKey:@"desc"];
    _price = [data objectForKey:@"price"];
    _image = [data objectForKey:@"image"];
    _url = [data objectForKey:@"url"];
    _pdfs = [[data objectForKey:@"pdf"] copy];
    
    _jsonData = [data description];
    
  }
  return self;
}

-(NSString *)description{
  
  return [self->_jsonData description];
}
@end
