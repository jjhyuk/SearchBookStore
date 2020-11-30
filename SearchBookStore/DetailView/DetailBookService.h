//
//  DetailBookService.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

@protocol DetailService <NSObject>

typedef void(^DetailServiceResultBlock)(NSDictionary *JSON, NSError *error);
-(void)fetchDetailDataWith:(NSString *)isbn13 handler:(DetailServiceResultBlock)handler;

@end
