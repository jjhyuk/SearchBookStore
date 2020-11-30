//
//  DetailBookServiceImpl.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

#import "DetailBookServiceImpl.h"

@implementation DetailBookServiceImpl

-(void)fetchDetailDataWith:(NSString *)isbn13 handler:(DetailServiceResultBlock)handler{
  
  JHLog();
  
  NSString *path = [NSString stringWithFormat:@"books/%@", isbn13];
  
  [JHNetworkReqeust excute:GET
                      path:path
                     param:nil
                   handler:^(NSDictionary * _Nullable JSON, NSString * _Nullable keyword, NSError * _Nullable error) {
    if(error) {
      handler(nil,error);
      return;
    }
    handler(JSON,nil);
  }];
}

@end
