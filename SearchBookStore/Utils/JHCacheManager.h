//
//  JHCacheManager.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/26.
//

#import <Foundation/Foundation.h>

#import "NSDictionary+Extension.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHCacheManager<KeyType,ObjectType> : NSObject

+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;

/// Singleton Instance
+(instancetype)shared;

/// The existence of data is checked with a key-value structure.
/// @param key key
-(BOOL)isExistKeyword:(KeyType)key;

/// Data is cached in a key-value structure.
/// @param data data
/// @param key key
-(void)setData:(ObjectType)data forKey:(KeyType)key;

/// Use the key to get the data. nill if there is no data.
/// @param key key
-(ObjectType)objectForKey:(KeyType)key;

@end

NS_ASSUME_NONNULL_END
