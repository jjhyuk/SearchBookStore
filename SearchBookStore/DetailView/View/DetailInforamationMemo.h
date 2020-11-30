//
//  DetailInforamationMemo.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/30.
//

#import <UIKit/UIKit.h>
#import "JHConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailInforamationMemo : UIView <UITextViewDelegate>

+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;

@property (nonatomic, strong) UILabel *memoTitle;
@property (nonatomic, strong) UITextView *memoTextView;

- (instancetype)initWith:(NSString *)isbn13;

@end

NS_ASSUME_NONNULL_END
