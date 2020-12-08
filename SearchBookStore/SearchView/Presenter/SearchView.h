//
//  SearchView.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "SearchBook.h"

/// List to be processed in SearchViewController
@protocol SearchView

/// If search fails
/// @param error error
-(void)failToReqeustSearchData:(NSError *)error;
/// If the search is successful
/// @param keyword Search Keywork
/// @param data SearchBook Array Data
-(void)successToReqeustSearchKeyword:(NSString *)keyword data:(NSArray<SearchBook *> *)data;

/// Asynchronous image update
/// @param data Image Data
/// @param isbn13 ISBN-13
-(void)updateImage:(NSData *)data isbn13:(NSString *)isbn13;

@end
