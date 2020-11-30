//
//  JHLog.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import <Foundation/Foundation.h>

// Log
#define JHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//

// Define Error Code
#define HTTP_ERROR_BASE              -1000                                       // -1000
#define SERVER_ERROR_BASE            -2000                                       // -2000
#define PARAMETER_ERROR_BASE         -3001                                       // -3001
#define LAST_PAGE_ERROR_BASE         -3002                                       // -3002

//

static NSString *const JHErrorDomain = @"jang.jinhyuk.error";

NS_ASSUME_NONNULL_BEGIN

@interface JHLogManager : NSObject

@end

NS_ASSUME_NONNULL_END
