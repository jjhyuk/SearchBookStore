//
//  JHNetworkReqeust.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import <Foundation/Foundation.h>
#import "JHConfiguration.h"
#import "JHLogManager.h"

typedef NS_ENUM(NSInteger, JHHttpMethod) {
  POST,
  GET,
  PUT,
  DELETE,
};

NS_ASSUME_NONNULL_BEGIN

@interface JHNetworkReqeust : NSObject

typedef void (^reqeustCompletionHandler)(NSDictionary * _Nullable JSON, NSString * _Nullable keyword, NSError * _Nullable error);
/// Network communication using URLSession. (Only GET, supported)
/// @param method Http Method (Currently only supports GET)
/// @param relativePath relative path
/// @param params parameters
/// @param handler compliteHandler
+(void) excute:(JHHttpMethod) method
          path:(NSString * _Nonnull) relativePath
         param:(NSDictionary * _Nullable) params
       handler:(reqeustCompletionHandler _Nonnull) handler;

@end

NS_ASSUME_NONNULL_END
