//
//  DetailBookPresenter.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

#import "DetailBookPresenter.h"

@interface DetailBookPresenter()
{
  id<DetailView> _view;
  id<DetailService> _service;
  JHCacheManager<NSString *,NSDictionary *> *_cacheManger;
}

@end

@implementation DetailBookPresenter

#pragma mark - PublicMethod

-(void)attchwithView:(id<DetailView>)view
             service:(id<DetailService>)service{
  
  JHLog();
  
  _view = view;
  _service = service;
  _cacheManger = [JHCacheManager shared];
}

-(void)reqestDataWithisbn13:(NSString *)isbn13{
  
  JHLog();
  
  
  NSString *detailKey = [JHConfiguration makeDetailkey:isbn13];
  
  if([self->_cacheManger isExistKeyword:detailKey]){
    NSDictionary *JSON = [self->_cacheManger objectForKey:detailKey];
    DetailBook *detailBook = [[DetailBook alloc] initWith:JSON];
    
    [self->_view successToReqeustDetailBook:detailBook];
    return;
  }
  
  [self->_service fetchDetailDataWith:isbn13 handler:^(NSDictionary *JSON, NSError *error) {
    if(error){
      // Error Handling
      [self->_view failToReqeustDetailBook:error];
      return;
    }
    
    // setCache
    [self->_cacheManger setData:JSON forKey:detailKey];
    
    DetailBook *detailBook = [[DetailBook alloc] initWith:JSON];
    
    [self->_view successToReqeustDetailBook:detailBook];
    return;
  }];
  
}

#pragma mark - Private Method

@end
