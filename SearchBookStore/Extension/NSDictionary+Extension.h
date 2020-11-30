//
//  NSDictionary+Extension.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import <Foundation/Foundation.h>
#import "JHLogManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary(Extension)

-(NSString *)urlEncodedString;
-(NSDictionary *)dictionaryByMergingDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
