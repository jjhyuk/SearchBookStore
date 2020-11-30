//
//  SearchService.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

@protocol SearchService <NSObject>

typedef void(^SerachServiceResultBlock)(NSDictionary *JSON, NSString *keyword, NSError *error);
-(void)fetchSearchDataWithKeywork:(NSString *)keyword page:(int)index handler:(SerachServiceResultBlock)handler;
@end
