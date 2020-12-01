//
//  SearchService.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

@protocol SearchService <NSObject>

typedef void(^SerachServiceResultBlock)(NSDictionary *JSON, NSString *keyword, NSError *error);
-(void)fetchSearchDataWithKeywork:(NSString *)keyword page:(int)index handler:(SerachServiceResultBlock)handler;

typedef void(^SerachImageServiceResultBlock)(NSData *data, NSString *isbn13, NSError *error);
-(void)fetchSearchImage:(NSString *)url handler:(SerachImageServiceResultBlock)handler;
@end
