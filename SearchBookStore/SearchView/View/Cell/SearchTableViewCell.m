//
//  SearchTableViewCell.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/29.
//

#import "SearchTableViewCell.h"
#import "UIColor+Color.h"

@interface SearchTableViewCell()
{
  UILabel *PriceTextLabel;
  
  NSLayoutConstraint *_imageWidth;
}

@end

@implementation SearchTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
  [self setSearchCell];
  return self;
}

-(void)setSearchCell{
  self.searchImageView = [[UIImageView alloc] init];
  [self.searchImageView setContentMode:UIViewContentModeScaleAspectFit];
  [self.searchImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.searchImageView.layer setCornerRadius:10.0f];
  [self.searchImageView setBackgroundColor:[UIColor colorFromRGB:0xF0F1F4]];
  
  self.searchTitleLabel = [[UILabel alloc] init];
  [self.searchTitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.searchTitleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
  [self.searchTitleLabel setNumberOfLines:3];
  [self.searchTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
  
  self.searchSubtitleLabel = [[UILabel alloc] init];
  [self.searchSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.searchSubtitleLabel setNumberOfLines:2];
  [self.searchSubtitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
  [self.searchSubtitleLabel setTextColor:[UIColor grayColor]];
  [self.searchSubtitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
  
  self.searchIsbn13Label = [[UILabel alloc] init];
  [self.searchIsbn13Label setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.searchIsbn13Label setTextColor:[UIColor blackColor]];
  [self.searchIsbn13Label setFont:[UIFont systemFontOfSize:12.0f]];
  [self.searchIsbn13Label setTextAlignment:NSTextAlignmentRight];
  
  self.searchPriceLabel = [[UILabel alloc] init];
  [self.searchPriceLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.searchPriceLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
  [self.searchPriceLabel setTextAlignment:NSTextAlignmentRight];
  
  self.searchUrlLabel = [[UILabel alloc] init];
  [self.searchUrlLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.searchUrlLabel setFont:[UIFont italicSystemFontOfSize:12.0f]];
  
  [self.contentView addSubview:self.searchImageView];
  [[self.searchImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
  [[self.searchImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:YES];
  self->_imageWidth = [self.searchImageView.widthAnchor constraintEqualToConstant:0.0f];
  [self->_imageWidth setActive:YES];
  [[self.searchImageView.heightAnchor constraintEqualToConstant:140.0f] setActive:YES];
  
  [self.contentView addSubview:self.searchIsbn13Label];
  [[self.searchIsbn13Label.topAnchor constraintEqualToAnchor:self.searchImageView.topAnchor constant:4] setActive:YES];
  [[self.searchIsbn13Label.leadingAnchor constraintEqualToAnchor:self.searchImageView.leadingAnchor constant:4] setActive:YES];
  [[self.searchIsbn13Label.trailingAnchor constraintEqualToAnchor:self.searchImageView.trailingAnchor constant:-4] setActive:YES];
  
  [self.contentView addSubview:self.searchTitleLabel];
  [[self.searchTitleLabel.topAnchor constraintEqualToAnchor:self.searchImageView.topAnchor] setActive:YES];
  [[self.searchTitleLabel.leadingAnchor constraintEqualToAnchor:self.searchImageView.trailingAnchor constant:8] setActive:YES];
  [[self.searchTitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.trailingAnchor constant:-8] setActive:YES];

  [self.contentView addSubview:self.searchSubtitleLabel];
  [[self.searchSubtitleLabel.topAnchor constraintEqualToAnchor:self.searchTitleLabel.bottomAnchor constant:4] setActive:YES];
  [[self.searchSubtitleLabel.leadingAnchor constraintEqualToAnchor:self.searchTitleLabel.trailingAnchor constant:8] setActive:YES];
  [[self.searchSubtitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.trailingAnchor constant:-8] setActive:YES];
  
  [self.contentView addSubview:self.searchPriceLabel];
  [[self.searchPriceLabel.bottomAnchor constraintEqualToAnchor:self.searchImageView.bottomAnchor constant:-4] setActive:YES];
  [[self.searchPriceLabel.trailingAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.trailingAnchor constant:-8] setActive:YES];
  
  PriceTextLabel = [[UILabel alloc] init];
  [PriceTextLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [PriceTextLabel setText:@"Price:"];
  [PriceTextLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
  [PriceTextLabel setTextAlignment:NSTextAlignmentRight];
  [self.contentView addSubview:PriceTextLabel];
  [[PriceTextLabel.bottomAnchor constraintEqualToAnchor:self.searchImageView.bottomAnchor constant:-4] setActive:YES];
  [[PriceTextLabel.trailingAnchor constraintEqualToAnchor:self.searchPriceLabel.leadingAnchor] setActive:YES];
  
  [self.contentView addSubview:self.searchUrlLabel];
  [[self.searchUrlLabel.topAnchor constraintEqualToAnchor:self.searchImageView.bottomAnchor constant:8] setActive:YES];
  [[self.searchUrlLabel.leadingAnchor constraintEqualToAnchor:self.searchImageView.leadingAnchor constant:8] setActive:YES];
  [[self.searchUrlLabel.trailingAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.trailingAnchor constant:-8] setActive:YES];
  [[self.searchUrlLabel.bottomAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.bottomAnchor constant:-8] setActive:YES];

}

-(void)setSearchImageInCell:(NSData *)imageData{
  if(imageData){
    [self->_imageWidth setConstant:140.0f];
    [self.searchImageView setImage:[UIImage imageWithData:imageData]];
  }
}

-(void)prepareForReuse{
  [super prepareForReuse];
  
  [self->_imageWidth setConstant:0.0f];
  [self.searchImageView setImage:nil];
    
}
@end
