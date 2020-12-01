//
//  JHCacheManager.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/26.
//

#import "JHCacheManager.h"

@interface JHCacheManager()
{
  NSCache *_cache;
  NSUserDefaults *_userDefaults;
}
@end

@implementation JHCacheManager

+(instancetype)shared{
  static id instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

-(BOOL)isExistKeyword:(id)key{
  
  if([self->_cache objectForKey:key]){
    return YES;
  } else {
    if([self->_userDefaults objectForKey:key]){
      
      // 캐시에 저장
      [self->_cache setObject:[self->_userDefaults objectForKey:key] forKey:key];
      return YES;
    } else {
      return NO;;
    }
  }
}

-(void)setData:(id)data forKey:(id)key{
  if(!data){
    return;
  }
  
  if([self isExistKeyword:key]){
    if([data isKindOfClass:[NSDictionary class]]){
      data = [[self objectForKey:key] dictionaryByMergingDictionary:data];
    }
  }
  
  [self->_cache setObject:data forKey:key];
  [self->_userDefaults setObject:data forKey:key];
}

-(id)objectForKey:(id)key{
  
  if(![self->_cache objectForKey:key]){
    if(![self->_userDefaults objectForKey:key]){
      return nil;
    } else {
      return [self->_userDefaults objectForKey:key];
    }
  } else {
    return [self->_cache objectForKey:key] ?: nil;
  }
}


#pragma mark - Private Method

- (instancetype)init
{
  
  JHLog();
  
  self = [super init];
  if (self) {
    self->_cache = [[NSCache alloc] init];
    [self->_cache setTotalCostLimit:10 * 1024 & 1024];
    
    self->_userDefaults = [NSUserDefaults standardUserDefaults];
  }
  return self;
}

@end
