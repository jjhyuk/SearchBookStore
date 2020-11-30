//
//  JHConfiguration.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "JHConfiguration.h"

@implementation JHConfiguration
//jang.jinhyuk.SearchBookStore
+ (NSString *)BaseURL {
  return @"https://api.itbook.store/1.0/";
}

+(NSString *)makeDetailkey:(NSString *)key{
  NSString *detailKey = [NSString stringWithFormat:@"Detail_%@",key];
  return detailKey;
}

+(NSString *)makeMemoKey:(NSString *)key{
  NSString *detailMemoKey = [NSString stringWithFormat:@"Detail_Memo_%@",key];
  return detailMemoKey;
}

@end
