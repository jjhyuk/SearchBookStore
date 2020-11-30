//
//  DatailView.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

#import "DetailBook.h"

@protocol DetailView

-(void)failToReqeustDetailBook:(NSError *)error;
-(void)successToReqeustDetailBook:(DetailBook *)book;

@end
