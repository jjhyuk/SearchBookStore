//
//  SearchBook.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/26.
//

#import <Foundation/Foundation.h>

#import "JHLogManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchBook : NSObject

+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;
@property (nonatomic, readonly) NSString *isbn13;
@property (nonatomic, readonly) NSString *price;
@property (nonatomic, readonly) NSString *image;
@property (nonatomic, readonly) NSString *url;

-(instancetype)initWith:(NSDictionary *)data;
-(NSString *)description;

@end

NS_ASSUME_NONNULL_END
