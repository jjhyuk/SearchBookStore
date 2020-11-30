//
//  ViewController.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import <UIKit/UIKit.h>

#import "SearchPresenter.h"
#import "JHLogManager.h"
#import "JHNetworkReqeust.h"
#import "SearchService.h"
#import "SearchServiceImpl.h"
#import "SearchBook.h"
#import "DetailViewController.h"
#import "SearchTableViewCell.h"

@interface SeachViewController : UIViewController <SearchView>

@property (nonatomic, strong) SearchPresenter *presenter;
@property (nonatomic, strong) id<SearchService> service;
@property (nonatomic, strong) JHCacheManager<NSString *,NSData *> *cacheManger;

@end

