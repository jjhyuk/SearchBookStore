//
//  DetailBook.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailBook : NSObject

+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;
@property (nonatomic, readonly) NSString *authors;
@property (nonatomic, readonly) NSString *publisher;
@property (nonatomic, readonly) NSString *language;
@property (nonatomic, readonly) NSString *isbn10;
@property (nonatomic, readonly) NSString *isbn13;
@property (nonatomic, readonly) NSString *pages;
@property (nonatomic, readonly) NSString *year;
@property (nonatomic, readonly) NSString *rating;
@property (nonatomic, readonly) NSString *desc;
@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSString *image;
@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSDictionary<NSString *,NSString *> *pdfs;

-(instancetype)initWith:(NSDictionary *)data;
-(NSString *)description;

@end

NS_ASSUME_NONNULL_END
