//
//  DetailInformationView.h
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/30.
//

#import <UIKit/UIKit.h>

#import "JHLogManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailInformationView : UIView

@property (nonatomic, strong) UIImageView *detailImageView;
@property (nonatomic, strong) UILabel *detailTitleLabel;
@property (nonatomic, strong) UILabel *detailSubtitleLabel;
@property (nonatomic, strong) UILabel *detailAuthorsLabel;
@property (nonatomic, strong) UILabel *detailPublisherLabel;
@property (nonatomic, strong) UILabel *detailLanguageLabel;
@property (nonatomic, strong) UILabel *detailIsbn10Label;
@property (nonatomic, strong) UILabel *detailIsbn13Label;
@property (nonatomic, strong) UILabel *detailPagesLabel;
@property (nonatomic, strong) UILabel *detailYearLabel;
@property (nonatomic, strong) UILabel *detailRatingLabel;
@property (nonatomic, strong) UILabel *detailDescLabel;
@property (nonatomic, strong) UILabel *detailPriceLabel;
@property (nonatomic, strong) UIButton *detailUrlButton;
@property (nonatomic, strong) UILabel *detailPDFLabel;

-(void)setDetailImage:(NSData *)imageData;
-(void)setDetailURLPath:(NSString *)urlPath;

@end

NS_ASSUME_NONNULL_END
