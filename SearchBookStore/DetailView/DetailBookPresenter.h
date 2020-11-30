//
//  DetailBookPresenter.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

#import <Foundation/Foundation.h>

#import "DetailView.h"
#import "DetailBookService.h"
#import "JHLogManager.h"
#import "JHCacheManager.h"
#import "JHConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailBookPresenter : NSObject

-(void)attchwithView:(id<DetailView>)view
             service:(id<DetailService>)service;

-(void)reqestDataWithisbn13:(NSString *)isbn13;


@end

NS_ASSUME_NONNULL_END
