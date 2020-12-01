//
//  SearchPresenter.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "SearchPresenter.h"

@interface SearchPresenter()
{
  id<SearchView> _view;
  id<SearchService> _service;
  JHCacheManager<NSString *,NSDictionary *> *_cacheManger;
  
  NSString *_keyword;
  int _currentPage;
  int _lastPage;
}

@end

@implementation SearchPresenter

#pragma mark - SearchPresenterImpl

-(void)attchwithView:(id<SearchView>)view
             service:(id<SearchService>)service{
  JHLog();
  
  _view = view;
  _service = service;
  _cacheManger = [JHCacheManager shared];
}


#pragma mark - Public Method

-(void)reqestDataWithKeyword:(NSString *)keyword{
  
  JHLog();
  
  keyword = [keyword lowercaseString];
  
  if(![self->_keyword isEqual:keyword]){
    self->_keyword = keyword;
    self->_currentPage = 0;
    self->_lastPage = 1;
  }
  
  if([self->_cacheManger isExistKeyword:self->_keyword]){
    NSDictionary *JSON = [self->_cacheManger objectForKey:self->_keyword];
    self->_currentPage = [[JSON objectForKey:@"page"] intValue];
    self->_lastPage = [[JSON objectForKey:@"total"] intValue];
    [self successToViewWith:JSON];
    return;
  }
  
  JHLog(@"Reqeust Search Keyword: %@", keyword);
  [self reqestDataWithKeyword:keyword
                         page:1];
}

-(void)reqeustNextData{
  
  JHLog();
  
  [self reqestDataWithKeyword:self->_keyword
                         page:self->_currentPage +1];
}

-(void)reqestDataWithKeyword:(NSString *)keyword
                        page:(int)index{
  
  JHLog();
  
  if(index > self->_lastPage){
    
    NSError *lastPageError = [NSError errorWithDomain:JHErrorDomain
                                               code:LAST_PAGE_ERROR_BASE
                                           userInfo:@{NSLocalizedDescriptionKey:@"You have reached the last page"}];
    [self->_view failToReqeustSearchData:lastPageError];
    return;
  }
  
  if(index < _currentPage){
    return;
  }
  self->_currentPage++;
  
  [_service fetchSearchDataWithKeywork:keyword
                                  page:index
                               handler:^(NSDictionary *JSON, NSString *keyword, NSError *error) {
    //Logic
    if(error) {
      [self->_view failToReqeustSearchData:error];
      return;
    }
    
    // setCache
    [self->_cacheManger setData:JSON forKey:keyword];
    
    if([self->_keyword isEqual:keyword])
    {
      [self successToViewWith:JSON];
      return;
    }
  }];
}

#pragma mark - Private Method

-(void)successToViewWith:(NSDictionary *)JSON{
  
  JHLog();
  
  self->_lastPage = [[JSON objectForKey:@"total"] intValue];
  NSArray *jsonArray = [JSON objectForKey:@"books"];
  
  NSArray<SearchBook *> *searchBooks = [self convertToSerachBookArray:jsonArray];
  
  [self->_view successToReqeustSearchKeyword:self->_keyword data:searchBooks];
}

-(NSArray<SearchBook *> *)convertToSerachBookArray:(NSArray *)array{
  
  JHLog();
  
  NSMutableArray<SearchBook *> *searchBooks = [[NSMutableArray alloc] init];
  [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    SearchBook *searchBook = [[SearchBook alloc] initWith:obj];
    [searchBooks addObject:searchBook];
  }];
  
  return [searchBooks copy];
}

-(void)reqeustImageData:(NSString *)url{
  [_service fetchSearchImage:url
                     handler:^(NSData *data, NSString *isbn13, NSError *error) {
    if(error){
      return;
    }
    
    [self->_view updateImage:data isbn13:isbn13];
    return;
  }];
}

@end
