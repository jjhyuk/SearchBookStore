//
//  SearchServiceImpl.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "SearchServiceImpl.h"

@implementation SearchServiceImpl

#pragma mark - SearchService Protocol

-(void)fetchSearchDataWithKeywork:(NSString *)keyword
                             page:(int)index
                          handler:(SerachServiceResultBlock)handler{
  JHLog();
  
  NSString *path = [NSString stringWithFormat:@"search/%@/%d", keyword, index];
  
  [JHNetworkReqeust excute:GET
                      path:path
                     param:nil
                   handler:^(NSDictionary * _Nullable JSON, NSString * _Nullable keyword, NSError * _Nullable error) {
    if(error) {
      handler(nil,nil,error);
      return;
    }
    
    handler(JSON,keyword,nil);
    return;
  }];
}

-(void)fetchSearchImage:(NSString *)url handler:(SerachImageServiceResultBlock)handler{
  
  [JHNetworkReqeust excuteImage:url
                        handler:^(NSData * _Nullable data, NSString * _Nullable isbn13, NSError * _Nullable error) {
    if(error){
      handler(nil,nil,error);
      return;
    }
    
    handler(data,isbn13,nil);
    return;
  }];
}



@end
