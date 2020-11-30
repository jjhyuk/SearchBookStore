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
  
  // 수정 필요
  NSString *path = [NSString stringWithFormat:@"search/%@/%d", keyword, index];
  
  [JHNetworkReqeust excute:GET
                      path:path
                     param:nil
                   handler:^(NSDictionary * _Nullable JSON, NSString * _Nullable keyword, NSError * _Nullable error) {
    if(error) {
      // 에러처리
      handler(nil,nil,error);
      return;
    }
    
    handler(JSON,keyword,nil);
    return;
  }];
}




@end
