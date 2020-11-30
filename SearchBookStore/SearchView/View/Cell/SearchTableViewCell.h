//
//  SearchTableViewCell.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *searchImageView;
@property (nonatomic, strong) UILabel *searchTitleLabel;
@property (nonatomic, strong) UILabel *searchSubtitleLabel;
@property (nonatomic, strong) UILabel *searchIsbn13Label;
@property (nonatomic, strong) UILabel *searchPriceLabel;
@property (nonatomic, strong) UILabel *searchUrlLabel;

-(void)setSearchImageInCell:(NSData *)imageData;


@end

NS_ASSUME_NONNULL_END
