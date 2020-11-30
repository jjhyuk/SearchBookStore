//
//  DetailInformationView.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/30.
//

#import "DetailInformationView.h"
#import "UIColor+Color.h"

@interface DetailInformationView()
{
  NSString *_URLLabel;
}
@end

@implementation DetailInformationView

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self setDetailInformationView];
  }
  return self;
}

-(instancetype)init{
  self = [super init];
  if (self) {
  
//    [self setDetailInformationView];
  }
  return self;
}

-(void)setDetailInformationView{
  [self setBackgroundColor:[UIColor whiteColor]];
  
  self.detailImageView = [[UIImageView alloc] init];
  [self.detailImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailImageView setContentMode:UIViewContentModeScaleAspectFit];
  [self.detailImageView.layer setBorderColor:[[UIColor blackColor] CGColor]];
  [self.detailImageView.layer setBorderWidth:1.0f];
  [self.detailImageView.layer setCornerRadius:5.0f];
  
  
  self.detailTitleLabel = [[UILabel alloc] init];
  [self.detailTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailTitleLabel setFont:[UIFont boldSystemFontOfSize:24.0f]];
  [self.detailTitleLabel setNumberOfLines:3];
  [self.detailTitleLabel setText:@"Title Label"];
  [self.detailTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
  
  self.detailSubtitleLabel = [[UILabel alloc] init];
  [self.detailSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailSubtitleLabel setFont:[UIFont systemFontOfSize:16.0f]];
  [self.detailSubtitleLabel setTextColor:[UIColor darkGrayColor]];
  [self.detailSubtitleLabel setText:@"Subtitle Label"];
  [self.detailSubtitleLabel setNumberOfLines:0];
  [self.detailSubtitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
  
  self.detailAuthorsLabel = [[UILabel alloc] init];
  [self.detailAuthorsLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailAuthorsLabel setText:@"Authors Label"];
  
  self.detailPublisherLabel = [[UILabel alloc] init];
  [self.detailPublisherLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailPublisherLabel setText:@"Publisher Label"];
  
  self.detailLanguageLabel = [[UILabel alloc] init];
  [self.detailLanguageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailLanguageLabel setText:@"Language Label"];
  
  self.detailIsbn10Label = [[UILabel alloc] init];
  [self.detailIsbn10Label setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailIsbn10Label setText:@"ISBN10 Label"];
  
  self.detailIsbn10Label = [[UILabel alloc] init];
  [self.detailIsbn10Label setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailIsbn10Label setText:@"ISBN10 Label"];
  
  self.detailIsbn13Label = [[UILabel alloc] init];
  [self.detailIsbn13Label setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailIsbn13Label setText:@"ISBN13 Label"];
  
  self.detailPagesLabel = [[UILabel alloc] init];
  [self.detailPagesLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailPagesLabel setText:@"Page Label"];
  
  self.detailYearLabel = [[UILabel alloc] init];
  [self.detailYearLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailYearLabel setText:@"Year Label"];
  
  self.detailRatingLabel = [[UILabel alloc] init];
  [self.detailRatingLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailRatingLabel setText:@"Rating Label"];
  
  self.detailDescLabel = [[UILabel alloc] init];
  [self.detailDescLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailDescLabel setText:@"DESC Label"];
  [self.detailDescLabel setNumberOfLines:0];
  
  self.detailPriceLabel = [[UILabel alloc] init];
  [self.detailPriceLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailPriceLabel setText:@"Price Label"];
  
  self.detailUrlButton = [[UIButton alloc] init];
  self.detailUrlButton = [UIButton buttonWithType:UIButtonTypeCustom];
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Show WebPage"
                                                                                     attributes:@{NSForegroundColorAttributeName: [UIColor colorFromRGB:0x0275d8],
                                                                                                  NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle),
                                                                                                  NSUnderlineColorAttributeName : [UIColor colorFromRGB:0x0275d8],
                                                                                                  NSFontAttributeName : [UIFont systemFontOfSize:12.f]
                                                                                     }];
  [self.detailUrlButton setAttributedTitle:attributedString forState:UIControlStateNormal];
  [self.detailUrlButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailUrlButton.titleLabel sizeToFit];
  [self.detailUrlButton setBackgroundColor:[UIColor clearColor]];
  [self.detailUrlButton addTarget:self action:@selector(actionWebPage) forControlEvents:UIControlEventTouchUpInside];
  
  
  self.detailPDFLabel = [[UILabel alloc] init];
  [self.detailPDFLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.detailPDFLabel setText:@"PDF Label"];
  
  [self addSubview:self.detailImageView];
  [[self.detailImageView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
  [[self.detailImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:8] setActive:YES];
  [[self.detailImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8] setActive:YES];
  [[self.detailImageView.heightAnchor constraintEqualToConstant:300.0f] setActive:YES];
  
  [self addSubview:self.detailTitleLabel];
  [[self.detailTitleLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor constant:4] setActive:YES];
  [[self.detailTitleLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor constant:-4] setActive:YES];
  [[self.detailTitleLabel.bottomAnchor constraintEqualToAnchor:self.detailImageView.bottomAnchor constant:-4] setActive:YES];
  
  [self addSubview:self.detailAuthorsLabel];
  [[self.detailAuthorsLabel.topAnchor constraintEqualToAnchor:self.detailImageView.bottomAnchor constant:8] setActive:YES];
  [[self.detailAuthorsLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailAuthorsLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailSubtitleLabel];
  [[self.detailSubtitleLabel.topAnchor constraintEqualToAnchor:self.detailAuthorsLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailSubtitleLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailSubtitleLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailPublisherLabel];
  [[self.detailPublisherLabel.topAnchor constraintEqualToAnchor:self.detailSubtitleLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailPublisherLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
//  [[self.detailPublisherLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  [self.detailPublisherLabel sizeToFit];
  
  UILabel *emptyLabel = [[UILabel alloc] init];
  [emptyLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [emptyLabel setText:@"/"];
  [self addSubview:emptyLabel];
  [[emptyLabel.topAnchor constraintEqualToAnchor:self.detailSubtitleLabel.bottomAnchor constant:4] setActive:YES];
  [[emptyLabel.leadingAnchor constraintEqualToAnchor:self.detailPublisherLabel.trailingAnchor] setActive:YES];
//  [[self.detailLanguageLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  [emptyLabel sizeToFit];
  
  [self addSubview:self.detailLanguageLabel];
  [[self.detailLanguageLabel.topAnchor constraintEqualToAnchor:self.detailSubtitleLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailLanguageLabel.leadingAnchor constraintEqualToAnchor:emptyLabel.trailingAnchor] setActive:YES];
//  [[self.detailLanguageLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  [self.detailLanguageLabel sizeToFit];
  
  [self addSubview:self.detailIsbn10Label];
  [[self.detailIsbn10Label.topAnchor constraintEqualToAnchor:self.detailLanguageLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailIsbn10Label.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailIsbn10Label.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailIsbn13Label];
  [[self.detailIsbn13Label.topAnchor constraintEqualToAnchor:self.detailIsbn10Label.bottomAnchor constant:4] setActive:YES];
  [[self.detailIsbn13Label.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailIsbn13Label.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailPagesLabel];
  [[self.detailPagesLabel.topAnchor constraintEqualToAnchor:self.detailIsbn13Label.bottomAnchor constant:4] setActive:YES];
  [[self.detailPagesLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailPagesLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailYearLabel];
  [[self.detailYearLabel.topAnchor constraintEqualToAnchor:self.detailPagesLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailYearLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailYearLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailRatingLabel];
  [[self.detailRatingLabel.topAnchor constraintEqualToAnchor:self.detailYearLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailRatingLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailRatingLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailDescLabel];
  [[self.detailDescLabel.topAnchor constraintEqualToAnchor:self.detailRatingLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailDescLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailDescLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailPriceLabel];
  [[self.detailPriceLabel.topAnchor constraintEqualToAnchor:self.detailDescLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailPriceLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
  [[self.detailPriceLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [self addSubview:self.detailUrlButton];
  [[self.detailUrlButton.topAnchor constraintEqualToAnchor:self.detailPriceLabel.bottomAnchor constant:4] setActive:YES];
  [[self.detailUrlButton.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  
  [[self.detailUrlButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-20] setActive:YES];
  
//  [self addSubview:self.detailPDFLabel];
//  [[self.detailPDFLabel.topAnchor constraintEqualToAnchor:self.detailUrlButton.bottomAnchor constant:4] setActive:YES];
//  [[self.detailPDFLabel.leadingAnchor constraintEqualToAnchor:self.detailImageView.leadingAnchor] setActive:YES];
//  [[self.detailPDFLabel.trailingAnchor constraintEqualToAnchor:self.detailImageView.trailingAnchor] setActive:YES];
  

}

-(void)setDetailImage:(NSData *)imageData{
//  [[self.detailImageView.heightAnchor constraintEqualToConstant:300.0f] setActive:YES];
  [self.detailImageView setImage:[UIImage imageWithData:imageData]];
}

-(void)setDetailURLPath:(NSString *)urlPath{
  self->_URLLabel = urlPath;
}

-(void)actionWebPage {
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString: self->_URLLabel] options:@{} completionHandler:nil];
}


@end
