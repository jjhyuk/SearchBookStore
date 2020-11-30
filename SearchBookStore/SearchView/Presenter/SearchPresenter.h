//
//  SearchPresenter.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import <Foundation/Foundation.h>

#import "SearchView.h"
#import "SearchService.h"
#import "JHLogManager.h"
#import "JHCacheManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchPresenter : NSObject

-(void)attchwithView:(id<SearchView>)view
             service:(id<SearchService>)service;

-(void)reqestDataWithKeyword:(NSString *)keyword;
-(void)reqeustNextData;
-(void)reqestDataWithKeyword:(NSString *)keyword page:(int)index;

@end

NS_ASSUME_NONNULL_END
