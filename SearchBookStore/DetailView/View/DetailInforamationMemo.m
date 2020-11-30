//
//  DetailInforamationMemo.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/30.
//

#import "DetailInforamationMemo.h"

@interface DetailInforamationMemo()
{
  NSString *_isbn13;
  NSUserDefaults *_userDefault;
}

@end


@implementation DetailInforamationMemo

- (instancetype)initWith:(NSString *)isbn13
{
  self = [super init];
  if (self) {
    self->_isbn13 = isbn13;
    self->_userDefault = [NSUserDefaults standardUserDefaults];
    
    [self setMemoContentView];
  }
  return self;
}

-(void)setMemoContentView{
  self.memoTitle = [[UILabel alloc] init];
  [self.memoTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.memoTitle setText:@"Your Memo"];
  [self.memoTitle setFont:[UIFont boldSystemFontOfSize:14.0f]];
  
  self.memoTextView = [[UITextView alloc] init];
  [self.memoTextView.layer setBorderColor:[[UIColor blackColor] CGColor]];
  [self.memoTextView.layer setBorderWidth:2.0f];
  [self.memoTextView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.memoTextView setScrollEnabled:NO];
  [self.memoTextView setDelegate:self];
  
  [self addSubview:self.memoTitle];
  [[self.memoTitle.topAnchor constraintEqualToAnchor:self.topAnchor constant:4] setActive:YES];
  [[self.memoTitle.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:4] setActive:YES];
  [self.memoTitle sizeToFit];
  
  [self addSubview:self.memoTextView];
  [[self.memoTextView.topAnchor constraintEqualToAnchor:self.memoTitle.bottomAnchor constant:4] setActive:YES];
  [[self.memoTextView.leadingAnchor constraintEqualToAnchor:self.memoTitle.leadingAnchor constant:4] setActive:YES];
  [[self.memoTextView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-4] setActive:YES];
  [[self.memoTextView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:4] setActive:YES];
  [[self.memoTextView.heightAnchor constraintGreaterThanOrEqualToConstant:30.0f] setActive:YES];
  
  if([self->_userDefault objectForKey:[JHConfiguration makeMemoKey:self->_isbn13]]){
    [self.memoTextView setText:[self->_userDefault objectForKey:[JHConfiguration makeMemoKey:self->_isbn13]]];
  }
}


#pragma mark - UITextViewDelegate

- (void)textViewDidEndEditing:(UITextView *)textView{
  
  [self->_userDefault setObject:textView.text forKey:[JHConfiguration makeMemoKey:self->_isbn13]];
}

- (void)textViewDidChange:(UITextView *)textView{
  
}

@end
