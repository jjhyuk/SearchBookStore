//
//  DetailViewController.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/27.
//

#import "DetailViewController.h"
#import "UIColor+Color.h"

@interface DetailViewController ()
{
  
  NSString *_isbn13;
  NSLayoutConstraint *_informationWidthConstraint;
  NSLayoutConstraint *_memoWidthConstraint;
}

@end

@implementation DetailViewController

-(instancetype)initWtihISBN13:(NSString *)isbn13{
  self = [super init];
  if (self) {
    self->_isbn13 = isbn13;
  }
  return self;
}

-(void)loadView{
  [super loadView];
  
  JHLog(@"%@",self->_isbn13);
  
  [self setScrollView];
  [self setContentView];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
  
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
  
  [self.view addGestureRecognizer:tap];
  
}

-(void)setScrollView{
  //  self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  self.scrollView = [[UIScrollView alloc] init];
  [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.scrollView setDelegate:self];
  [self.scrollView setScrollEnabled:YES];
  [self.scrollView setPagingEnabled:NO];
  
  [self.view addSubview:self.scrollView];
  [[self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
  [[self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor] setActive:YES];
  [[self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor] setActive:YES];
  [[self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:YES];
}

-(void)setContentView{
  
  self.informationView = [[DetailInformationView alloc] init];
  [self.informationView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.informationView setBackgroundColor:[UIColor whiteColor]];
  
  self.memoView = [[DetailInforamationMemo alloc] initWith:self->_isbn13];
  [self.memoView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.memoView setBackgroundColor:[UIColor whiteColor]];
  
  [self.scrollView addSubview:self.informationView];
  [[self.informationView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor] setActive:YES];
  //  [[self.informationView.widthAnchor constraintEqualToConstant:self.view.frame.size.width] setActive:YES];
  self->_informationWidthConstraint = [self.informationView.widthAnchor constraintEqualToConstant:self.view.frame.size.width];
  [self->_informationWidthConstraint setActive:YES];
  
  [self.scrollView addSubview:self.memoView];
  [[self.memoView.topAnchor constraintEqualToAnchor:self.informationView.bottomAnchor] setActive:YES];
  [[self.memoView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant: -16] setActive:YES];
  self->_memoWidthConstraint = [self.memoView.widthAnchor constraintEqualToConstant:self.view.frame.size.width];
  [self->_memoWidthConstraint setActive:YES];
}


-(void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self.navigationItem setLargeTitleDisplayMode:UINavigationItemLargeTitleDisplayModeNever];
  
  _service = [[DetailBookServiceImpl alloc] init];
  _presenter = [[DetailBookPresenter alloc] init];
  [_presenter attchwithView:self service:_service];
  
  _cacheManger = [JHCacheManager shared];
  
  [_presenter reqestDataWithisbn13:self->_isbn13];
}

-(void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:YES];
  
  JHLog(@"%@",self->_isbn13);
}

- (void)viewDidLayoutSubviews{
  [super viewDidLayoutSubviews];
  
  self->_informationWidthConstraint.constant = self.view.frame.size.width;
  self->_memoWidthConstraint.constant = self.view.frame.size.width;
  
  [self.scrollView setContentSize:CGSizeMake(self.scrollView.bounds.size.width, self.informationView.bounds.size.height + self.memoView.bounds.size.height + 200)];
}


-(void)failToReqeustDetailBook:(NSError *)error {
  
  JHLog(@"error: %@",error);
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!"
                                                                 message:[error localizedDescription]
                                                          preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                   style:UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction * action){
    [alert dismissViewControllerAnimated:YES completion:nil];
  }];
  [alert addAction:cancel];
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self presentViewController:alert animated:YES completion:nil];
  });
}

-(void)successToReqeustDetailBook:(DetailBook *)book {
  
  JHLog(@"book: %@",[book description]);
  
  __block NSData *imageData;
  if([self->_cacheManger isExistKeyword:book.isbn13]){
    imageData = [self->_cacheManger objectForKey:book.isbn13];
  } else {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:book.image]];
      [self->_cacheManger setData:imageData forKey:book.isbn13];
    });
  }
  
  self.detailResult = book;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.informationView.detailTitleLabel setText:[self.detailResult title]];
    [self.informationView.detailSubtitleLabel setText:[self.detailResult subtitle]];
    [self.informationView setDetailImage:[self->_cacheManger objectForKey:self.detailResult.isbn13]];
    [self.informationView.detailAuthorsLabel setText:[self.detailResult authors]];
    [self.informationView.detailPublisherLabel setText:[self.detailResult publisher]];
    [self.informationView.detailLanguageLabel setText:[self.detailResult language]];
    [self.informationView.detailIsbn10Label setText:[self.detailResult isbn10]];
    [self.informationView.detailIsbn13Label setText:[self.detailResult isbn13]];
    [self.informationView.detailPagesLabel setText:[self.detailResult pages]];
    [self.informationView.detailYearLabel setText:[self.detailResult year]];
    [self.informationView.detailRatingLabel setText:[self.detailResult rating]];
    [self.informationView.detailDescLabel setText:[self.detailResult desc]];
    [self.informationView.detailPriceLabel setText:[self.detailResult price]];
    [self.informationView setDetailURLPath:[self.detailResult url]];
  });
}

-(void)keyboardWillShow:(NSNotification *)notification{
  NSDictionary* info = [notification userInfo];
  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
  
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height + 30, 0.0);
  self.scrollView.contentInset = contentInsets;
  self.scrollView.scrollIndicatorInsets = contentInsets;
  
  CGRect aRect = self.view.frame;
  aRect.size.height -= kbSize.height;
  if (!CGRectContainsPoint(aRect, self.memoView.frame.origin) ) {
    [self.scrollView setContentOffset:CGPointMake(0,self.scrollView.frame.size.height) animated:YES];
  }
}

-(void)keyboardWillHide:(NSNotification *)notification{
  UIEdgeInsets contentInset = UIEdgeInsetsZero;
  [self.scrollView setContentInset:contentInset];
  [self.scrollView setScrollIndicatorInsets:contentInset];
}

-(void)dismissKeyboard
{
  [self.view endEditing:YES];
}
@end
