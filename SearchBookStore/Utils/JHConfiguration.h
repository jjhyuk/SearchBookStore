//
//  JHConfiguration.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHConfiguration : NSObject

@property (nonatomic, readonly, class) NSString *BaseURL;

+(NSString *)makeDetailkey:(NSString *)key;
+(NSString *)makeMemoKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
