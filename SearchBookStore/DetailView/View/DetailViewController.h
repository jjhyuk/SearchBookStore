//
//  DetailViewController.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/27.
//

#import <UIKit/UIKit.h>

#import "JHLogManager.h"
#import "DetailView.h"
#import "DetailBookPresenter.h"
#import "DetailBookService.h"
#import "JHCacheManager.h"
#import "DetailBookServiceImpl.h"
#import "DetailInformationView.h"
#import "DetailInforamationMemo.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <DetailView, UIScrollViewDelegate>

+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;

-(instancetype)initWtihISBN13:(NSString *)isbn13;

@property (nonatomic, strong) DetailBookPresenter *presenter;
@property (nonatomic, strong) id<DetailService> service;
@property (nonatomic, strong) JHCacheManager<NSString *,NSData *> *cacheManger;

@property (nonatomic, retain) DetailBook *detailResult;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) DetailInformationView *informationView;
@property (nonatomic, strong) DetailInforamationMemo *memoView;

@end

NS_ASSUME_NONNULL_END
